---@class AscensionLoader
---@type table
local AscensionLoader = QuestieLoader:CreateModule("AscensionLoader")

---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")

---@type table
local AscensionDB = QuestieLoader:ImportModule("AscensionDB")
_G.AscensionDB = _G.AscensionDB or AscensionDB

local _overridesInjected = false
local _zonesApplied = false

local function _LoadIfString(data, label)
    if not data then return nil end
    if type(data) == "string" then
        local fn, err = loadstring(data)
        if not fn then
            if Questie and Questie.Debug then
                Questie:Debug(Questie.DEBUG_CRITICAL, "[AscensionLoader] loadstring failed for " .. tostring(label) .. ": " .. tostring(err))
            end
            return nil
        end
        local ok, tbl = pcall(fn)
        if not ok then
            if Questie and Questie.Debug then
                Questie:Debug(Questie.DEBUG_CRITICAL, "[AscensionLoader] executing chunk failed for " .. tostring(label) .. ": " .. tostring(tbl))
            end
            return nil
        end
        return tbl
    end
    return data
end

local function _MergeInto(dst, src)
    if type(dst) ~= "table" or type(src) ~= "table" then return end
    for id, entry in pairs(src) do
        dst[id] = entry
    end
end

-- Apply Ascension custom uiMapId->areaId mappings into ZoneDB (used by map/Journey)
function AscensionLoader:ApplyZoneTables()
    if _zonesApplied then return end
    if not AscensionZoneTables or not AscensionZoneTables.uiMapIdToAreaId then return end

    local ZoneDB = QuestieLoader:ImportModule("ZoneDB")
    if not ZoneDB then return end

    ZoneDB.private = ZoneDB.private or {}
    ZoneDB.private.uiMapIdToAreaId = ZoneDB.private.uiMapIdToAreaId or {}
    ZoneDB.private.areaIdToUiMapId = ZoneDB.private.areaIdToUiMapId or {}

    for uiMapId, areaId in pairs(AscensionZoneTables.uiMapIdToAreaId) do
        if uiMapId and areaId and ZoneDB.private.uiMapIdToAreaId[uiMapId] == nil then
            ZoneDB.private.uiMapIdToAreaId[uiMapId] = areaId
        end

        -- Ascension uses custom map ids for spawns/waypoints (e.g. 1238 for Northshire Valley).
        -- QuestieMap draws by converting AreaId->UiMapId, so register these ids as self-mapping.
        if uiMapId and ZoneDB.private.areaIdToUiMapId[uiMapId] == nil then
            ZoneDB.private.areaIdToUiMapId[uiMapId] = uiMapId
        end
    end

    -- Also map parentMapIDs (e.g. 10138) to a usable uiMapId to avoid fallback errors.
    if AscensionUiMapData and AscensionUiMapData.uiMapData then
        for uiMapId, data in pairs(AscensionUiMapData.uiMapData) do
            if uiMapId and ZoneDB.private.areaIdToUiMapId[uiMapId] == nil then
                ZoneDB.private.areaIdToUiMapId[uiMapId] = uiMapId
            end
            if data and type(data.parentMapID) == "number" and ZoneDB.private.areaIdToUiMapId[data.parentMapID] == nil then
                ZoneDB.private.areaIdToUiMapId[data.parentMapID] = uiMapId
            end
        end
    end

    _zonesApplied = true
end

-- Inject Ascension tables into QuestieDB *Overrides* so QueryQuestSingle/QueryNPCSingle can see them
function AscensionLoader:InjectOverrides()
    if _overridesInjected then return end
    _overridesInjected = true

    QuestieDB.npcDataOverrides = QuestieDB.npcDataOverrides or {}
    QuestieDB.objectDataOverrides = QuestieDB.objectDataOverrides or {}
    QuestieDB.itemDataOverrides = QuestieDB.itemDataOverrides or {}
    QuestieDB.questDataOverrides = QuestieDB.questDataOverrides or {}

    local npcData    = _LoadIfString(AscensionDB and AscensionDB.npcData, "AscensionDB.npcData")
    local objectData = _LoadIfString(AscensionDB and AscensionDB.objectData, "AscensionDB.objectData")
    local itemData   = _LoadIfString(AscensionDB and AscensionDB.itemData, "AscensionDB.itemData")
    local questData  = _LoadIfString(AscensionDB and AscensionDB.questData, "AscensionDB.questData")

    _MergeInto(QuestieDB.npcDataOverrides, npcData)
    _MergeInto(QuestieDB.objectDataOverrides, objectData)
    _MergeInto(QuestieDB.itemDataOverrides, itemData)
    _MergeInto(QuestieDB.questDataOverrides, questData)

    -- Keep a lightweight list of custom quest ids for search/UI (DO NOT touch QuestPointers; those are numeric stream pointers)
    if type(questData) == "table" then
        QuestieDB.ascensionQuestIds = QuestieDB.ascensionQuestIds or {}
        for questId, _ in pairs(questData) do
            if type(questId) == "number" then
                QuestieDB.ascensionQuestIds[questId] = true
            end
        end
    end
end

-- Hook QuestieDB.Initialize to guarantee timing for overrides
do
    local originalInitialize = QuestieDB and QuestieDB.Initialize
    if type(originalInitialize) == "function" then
        function QuestieDB:Initialize(...)
            -- 1) Inject overrides before the DB handles are created
            AscensionLoader:InjectOverrides()

            local ret = originalInitialize(self, ...)

            -- 2) Apply zones after ZoneDB is ready
            AscensionLoader:ApplyZoneTables()

            -- 3) Refresh Journey caches (zoneMap/zones) so "Quests by Zone" sees the new data
            local ZoneDB = QuestieLoader:ImportModule("ZoneDB")
            local QuestieJourney = QuestieLoader:ImportModule("QuestieJourney")
            if ZoneDB and QuestieJourney then
                QuestieJourney.zoneMap = ZoneDB:GetZonesWithQuests(true)
                QuestieJourney.zones = ZoneDB:GetRelevantZones()

                -- Clear the UI cache so the tree gets rebuilt
                if QuestieJourney.private then
                    QuestieJourney.private.treeCache = nil
                    QuestieJourney.private.lastZoneSelection = {}
                end

                -- If the Journey window is open, rebuild the current tab
                if QuestieJourneyFrame and QuestieJourneyFrame:IsShown() and QuestieJourney.tabGroup then
                    local p = QuestieJourney.private
                    if p and p.containerCache and p.lastOpenWindow then
                        p:HandleTabChange(p.containerCache, p.lastOpenWindow)
                    end
                end
            end

            return ret
        end
    end
end

-- >>> NEW: Make QuestieDB.GetQuest work for Ascension override quests (Journey needs this)
do
    local originalGetQuest = QuestieDB.GetQuest
    if type(originalGetQuest) == "function" then
        function QuestieDB.GetQuest(questId)
            local q = originalGetQuest(questId)
            if q then return q end

            -- Fallback: build a minimal quest object from QueryQuestSingle (works with overrides)
            local name = QuestieDB.QueryQuestSingle(questId, "name")
            if not name then return nil end

            local level = QuestieDB.QueryQuestSingle(questId, "level") or QuestieDB.QueryQuestSingle(questId, "questLevel")
            local reqLevel = QuestieDB.QueryQuestSingle(questId, "requiredLevel") or QuestieDB.QueryQuestSingle(questId, "minLevel")
            local desc = QuestieDB.QueryQuestSingle(questId, "objectiveText") or QuestieDB.QueryQuestSingle(questId, "description") or QuestieDB.QueryQuestSingle(questId, "details")

            -- Questie modules expect these common fields
            return {
                Id = questId,
                id = questId,
                name = name,
                level = level or reqLevel or 0,
                requiredLevel = reqLevel or 0,
                Description = desc, -- Journey tooltip reads quest.Description
            }
        end
    end
end


-- Ensure zones also get applied when Questie finishes loading (covers edge cases)
do
    local f = CreateFrame("Frame")
    f:RegisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", function(_, _, name)
        if name ~= "Questie-335" then return end
        if C_Timer and C_Timer.After then
            C_Timer.After(0, function() AscensionLoader:ApplyZoneTables() end)
        else
            AscensionLoader:ApplyZoneTables()
        end
    end)
end

return AscensionLoader
