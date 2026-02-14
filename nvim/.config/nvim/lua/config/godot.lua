local M = {}

M.connect_lsp = function()
    local port = os.getenv("GDScript_Port") or "6005"
    local cmd = vim.lsp.rpc.connect("127.0.0.1", tonumber(port))
    local pipe = "/tmp/godot.pipe"

    vim.lsp.start({
        name = "Godot",
        cmd = cmd,
        root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
        on_attach = function(_, _)
            vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
        end,
    })
end

---@param use_default boolean
M.prepare_debugger = function(use_default)
    local project = pick_project(use_default)
    --TODO: pick configuration?
    local co = coroutine.running()
    client.msbuild:msbuild_build(
        { targetPath = project.path, targetFramework = project.msbuild_props.targetFramework },
        function(res)
            coroutine.resume(co, res.success)
        end,
        {
            on_crash = function()
                coroutine.resume(co, false)
            end,
        }
    )
    local build_res = coroutine.yield()

    if build_res == false then
        --TODO: add build errors to qf list
        error("Aborting debug session due to build failure")
        return nil
    end

    local launch_profile_name = select_launch_profile_name(vim.fs.dirname(project.path))

    client.debugger:debugger_start(
        {
            targetPath = project.path,
            targetFramework = project.msbuild_props.targetFramework,
            configuration = "Debug",
            launchProfileName = launch_profile_name,
        },
        function(res)
            coroutine.resume(co, res.port)
        end,
        {
            on_crash = function()
                logger.error("Debugger failed to start")
                coroutine.resume(co)
            end,
        }
    )
    local curr_debugger_port = coroutine.yield()

    return curr_debugger_port
end

return M
