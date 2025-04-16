
TEST [[
local function x(a, b)
    return a, b
end
x(1)
]]

TEST [[
---@param a integer
---@param b integer
local function x(a, b)
    return a, b
end
<!x(1)!>
<!x()!>
]]
(EXPECT_MSG('DIAG_MISS_ARGS', 2, 1))
(EXPECT_MSG('DIAG_MISS_ARGS', 2, 0))

TEST [[
---@param a integer
---@param b integer
local function x(a, b)
    return a, b
end
<!x()!>
]]

TEST [[
---@param a integer
---@param b integer
---@param ... integer
local function x(a, b, ...)
    return a, b, ...
end
x(1, 2)
]]

TEST [[
---@param a integer
---@param b integer
local function f(a, b)
end

f(...)
]]

TEST [[
---@param a integer
---@param b integer
local function f(a, b)
end

local function return2Numbers()
    return 1, 2
end

f(return2Numbers())
]]

TEST [[
---@param a integer
---@param b? integer
local function x(a, b)
    return a, b
end
x(1)
]]

TEST [[
---@param b integer?
local function x(a, b)
    return a, b
end
x(1)
]]

TEST [[
---@param b integer|nil
local function x(a, b)
    return a, b
end
x(1)
]]

TEST [[
local t = {}

function t:init() end

<!t.init()!>
]]
