---@module "overseer"

---@param line string
---@return { version: string } | nil
local matchFirstLine = function(line)
    local pattern = "Godot Engine v(.*) %- https://godotengine.org"
    local version = line:match(pattern)
    if version then
        return { version = version }
    end
    return nil
end

---@param line string
---@return { api: string, mode: string, gpu: string } | nil
local matchSecondLine = function(line)
    local pattern = "^(.*) %- (.*) %- Using Device ?#?[0-9]*: (.*)$"
    local api, mode, gpu = line:match(pattern)
    if api and mode and gpu then
        return { api = api, mode = mode, gpu = gpu }
    end
    return nil
end

---@type overseer.ComponentFileDefinition
local comp = {
    desc = "Run on Godot started",
    params = {
        on_started = {
            type = "opaque",
            description = "to be run upon detection of Godot running",
        },
    },
    constructor = function(params)
        local started = false
        local linesMatched = 0

        return {
            ---@return nil|boolean
            on_pre_start = function(self, task)
                started = false
                return true
            end,
            ---@param lines string[] Completed lines of output, with ansi codes removed.
            on_output_lines = function(self, task, lines)
                if started then
                    return
                end
                for _, line in ipairs(lines) do
                    if linesMatched == 1 then
                        local result = matchSecondLine(line)
                        if result then
                            linesMatched = 2
                            params.on_started()
                        end
                    end
                    if linesMatched == 0 then
                        local result = matchFirstLine(line)
                        if result then
                            linesMatched = 1
                        end
                    end
                end
            end,
        }
    end,
}
return comp
