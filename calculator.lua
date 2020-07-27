local imgui = require 'imgui';
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local calculatorWindow = imgui.ImBool(false);
local weight, height = getScreenResolution();
local result = '';
local inputBufferText = imgui.ImBuffer(256)

local inicfg = require 'inicfg'

function imgui.OnDrawFrame()

    if calculatorWindow.v then
        imgui.ShowCursor = true;
        imgui.SetNextWindowSize(imgui.ImVec2(weight / 5.5, height / 3.5), imgui.Cond.FirstUseEver);
        imgui.SetNextWindowPos(imgui.ImVec2(weight / 2, height /2), imgui.Cond.FirstUseEver);
        imgui.Begin(u8'##—œ¿—»¡Œ ◊“Œ — ¿◊¿À ›“” ’”…Õﬁ', calculatorWindow, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoTitleBar);
		imgui.BeginChild('##≈“Œ œ¿—’¿À ¿', imgui.ImVec2(weight / 5.9, height / 3.7), true);
        imgui.Text(result);
        imgui.InputText(u8'##Àﬁ¡Àﬁ “≈¡ﬂ <3', inputBufferText);
        if imgui.Button('9', imgui.ImVec2(40, 40)) then
            inputBufferText.v = string.format('%s9', inputBufferText.v);
        end
        imgui.SameLine();
        if imgui.Button('8', imgui.ImVec2(40, 40)) then
            inputBufferText.v = string.format('%s8', inputBufferText.v);
        end
        imgui.SameLine();
        if imgui.Button('7', imgui.ImVec2(40, 40)) then
            inputBufferText.v = string.format('%s7', inputBufferText.v);
        end
		imgui.SameLine();
		if imgui.Button('/', imgui.ImVec2(40, 40)) then
			local bufferFirstNum, bufferAct = result:match('(%d+)(.+)');
			if tonumber(bufferFirstNum) then
				local numResult = tonumber(bufferFirstNum) / tonumber(inputBufferText.v);
				result = string.format('%s/', tostring(numResult));
				inputBufferText.v = '';
			else
				result = string.format('%s/', inputBufferText.v);
				inputBufferText.v = '';
			end
		end
		imgui.SameLine();
		if imgui.Button('CLR', imgui.ImVec2(40, 40)) then
            inputBufferText.v = '';
			result = '';
        end
		--imgui.SameLine();
        if imgui.Button('6', imgui.ImVec2(40, 40)) then
            inputBufferText.v = string.format('%s6', inputBufferText.v);
        end
        imgui.SameLine();
        if imgui.Button('5', imgui.ImVec2(40, 40)) then
            inputBufferText.v = string.format('%s5', inputBufferText.v);
        end
        imgui.SameLine();
        if imgui.Button('4', imgui.ImVec2(40, 40)) then
            inputBufferText.v = string.format('%s4', inputBufferText.v);
        end
		imgui.SameLine();
		if imgui.Button('*', imgui.ImVec2(40, 40)) then
			local bufferFirstNum, bufferAct = result:match('(%d+)(.+)');
			if tonumber(bufferFirstNum) then
				local numResult = tonumber(bufferFirstNum) * tonumber(inputBufferText.v);
				result = string.format('%s*', tostring(numResult));
				inputBufferText.v = '';
			else
				result = string.format('%s*', inputBufferText.v);
				inputBufferText.v = '';
			end
        end
		imgui.SameLine();
		if imgui.Button('SQRT', imgui.ImVec2(40, 40)) then
			if tonumber(inputBufferText.v) then
				local bufferResult = math.sqrt(tonumber(inputBufferText.v));
				result = tostring(bufferResult);
			end
		end
        if imgui.Button('3', imgui.ImVec2(40, 40)) then
            inputBufferText.v = string.format('%s3', inputBufferText.v);
        end
        imgui.SameLine();
        if imgui.Button('2', imgui.ImVec2(40, 40)) then
            inputBufferText.v = string.format('%s2', inputBufferText.v);
        end
        imgui.SameLine();
        if imgui.Button('1', imgui.ImVec2(40, 40)) then
            inputBufferText.v = string.format('%s1', inputBufferText.v);
        end
		imgui.SameLine();
		if imgui.Button('-', imgui.ImVec2(40, 40)) then
            local bufferFirstNum, bufferAct = result:match('(%d+)(.+)');
			if tonumber(bufferFirstNum) then
				local numResult = tonumber(bufferFirstNum) - tonumber(inputBufferText.v);
				result = string.format('%s-', tostring(numResult));
				inputBufferText.v = '';
			else
				result = string.format('%s-', inputBufferText.v);
				inputBufferText.v = '';
			end
        end
		imgui.SameLine();
		if imgui.Button('^', imgui.ImVec2(40, 40)) then
			result = string.format('%s^', inputBufferText.v);
			inputBufferText.v = '';
		end
		if imgui.Button('0', imgui.ImVec2(89, 40)) then
            inputBufferText.v = string.format('%s0', inputBufferText.v);
        end
		imgui.SameLine();
		if imgui.Button('+', imgui.ImVec2(40, 40)) then
			local bufferFirstNum, bufferAct = result:match('(%d+)(.+)');
			if tonumber(bufferFirstNum) then
				local numResult = tonumber(bufferFirstNum) + tonumber(inputBufferText.v);
				result = string.format('%s+', tostring(numResult));
				inputBufferText.v = '';
			else
				result = string.format('%s+', inputBufferText.v);
				inputBufferText.v = '';
			end
        end
		imgui.SameLine();
		if imgui.Button('=', imgui.ImVec2(40, 40)) then
			local bufferFirstNum, bufferAct = result:match('(%d+)(.+)');
			if bufferAct == '+' then
				local numResult = tonumber(bufferFirstNum) + tonumber(inputBufferText.v);
				result = tostring(numResult);
			elseif bufferAct == '-' then
				local numResult = tonumber(bufferFirstNum) - tonumber(inputBufferText.v);
				result = tostring(numResult);
			elseif bufferAct == '/' then
				local numResult = tonumber(bufferFirstNum) / tonumber(inputBufferText.v);
				result = tostring(numResult);
			elseif bufferAct == '*' then
				local numResult = tonumber(bufferFirstNum) * tonumber(inputBufferText.v);
				result = tostring(numResult);
			elseif bufferAct == '^' then
				local numResult = tonumber(bufferFirstNum) ^ tonumber(inputBufferText.v);
				result = tostring(numResult);
			end
			inputBufferText.v = '';
		end
		imgui.EndChild();
        imgui.End();
    else
        imgui.ShowCursor = false;
    end

end

local directIni = "moonloader/Calculator/settings.ini"

function main()
    repeat wait(0); until isSampAvailable();
    mainIni = inicfg.load(nil, directIni)
    if not doesFileExist(direcIni) then inicfg.save(mainIni, direcIni) end
    load_theme()
    while true do
        wait(0);
        if testCheat('CALC') then
            calculatorWindow.v = not calculatorWindow.v;
            imgui.Process = calculatorWindow.v;
        end
    end
end

function create_ini()
    mainIni.Config.Theme = 0
    if inicfg.save(mainIni, directini) then
        sampSendChat("MainIni SAVE")
    end
end

function load_theme()
    local mainIni = inicfg.load(nil, directIni)
    setLightStyle(mainIni.Config.Theme)
end

function setLightStyle(style)
    if style == 0 then
        local style = imgui.GetStyle()
        local colors = style.Colors
        local clr = imgui.Col
        local ImVec4 = imgui.ImVec4

        colors[clr.Text] = ImVec4(0.00, 0.00, 0.00, 1.00)
        colors[clr.TextDisabled] = ImVec4(0.60, 0.60, 0.60, 1.00)
        colors[clr.WindowBg] = ImVec4(0.94, 0.94, 0.94, 0.94)
        colors[clr.ChildWindowBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
        colors[clr.PopupBg] = ImVec4(1.00, 1.00, 1.00, 0.94)
        colors[clr.Border]= ImVec4(0.00, 0.00, 0.00, 0.39)
        colors[clr.BorderShadow] = ImVec4(1.00, 1.00, 1.00, 0.10)
        colors[clr.FrameBg] = ImVec4(1.00, 1.00, 1.00, 0.94)
        colors[clr.FrameBgHovered]= ImVec4(0.26, 0.59, 0.98, 0.40)
        colors[clr.FrameBgActive] = ImVec4(0.26, 0.59, 0.98, 0.67)
        colors[clr.TitleBg] = ImVec4(0.96, 0.96, 0.96, 1.00)
        colors[clr.TitleBgCollapsed] = ImVec4(1.00, 1.00, 1.00, 0.51)
        colors[clr.TitleBgActive] = ImVec4(0.82, 0.82, 0.82, 1.00)
        colors[clr.MenuBarBg] = ImVec4(0.86, 0.86, 0.86, 1.00)
        colors[clr.ScrollbarBg] = ImVec4(0.98, 0.98, 0.98, 0.53)
        colors[clr.ScrollbarGrab] = ImVec4(0.69, 0.69, 0.69, 1.00)
        colors[clr.ScrollbarGrabHovered] = ImVec4(0.59, 0.59, 0.59, 1.00)
        colors[clr.ScrollbarGrabActive] = ImVec4(0.49, 0.49, 0.49, 1.00)
        colors[clr.ComboBg] = ImVec4(0.86, 0.86, 0.86, 0.99)
        colors[clr.CheckMark] = ImVec4(0.26, 0.59, 0.98, 1.00)
        colors[clr.SliderGrab] = ImVec4(0.24, 0.52, 0.88, 1.00)
        colors[clr.SliderGrabActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
        colors[clr.Button]= ImVec4(0.26, 0.59, 0.98, 0.40)
        colors[clr.ButtonHovered] = ImVec4(0.26, 0.59, 0.98, 1.00)
        colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
        colors[clr.Header]= ImVec4(0.26, 0.59, 0.98, 0.31)
        colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
        colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
        colors[clr.ResizeGrip] = ImVec4(1.00, 1.00, 1.00, 0.50)
        colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
        colors[clr.ResizeGripActive] = ImVec4(0.26, 0.59, 0.98, 0.95)
        colors[clr.CloseButton] = ImVec4(0.59, 0.59, 0.59, 0.50)
        colors[clr.CloseButtonHovered] = ImVec4(0.98, 0.39, 0.36, 1.00)
        colors[clr.CloseButtonActive] = ImVec4(0.98, 0.39, 0.36, 1.00)
        colors[clr.PlotLines] = ImVec4(0.39, 0.39, 0.39, 1.00)
        colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
        colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
        colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
        colors[clr.TextSelectedBg]= ImVec4(0.26, 0.59, 0.98, 0.35)
        colors[clr.ModalWindowDarkening] = ImVec4(0.20, 0.20, 0.20, 0.35)
    end
    if style == 1 then
        imgui.SwitchContext()
    local style  = imgui.GetStyle()
    local colors = style.Colors
    local clr    = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2

    style.WindowPadding       = ImVec2(12, 6)
    style.WindowRounding      = 8
    style.ChildWindowRounding = 7
    style.FramePadding        = ImVec2(7, 3)
    style.FrameRounding       = 4
    style.ItemSpacing         = ImVec2(6, 6)
    style.TouchExtraPadding   = ImVec2(0, 0)
    style.IndentSpacing       = 15
    style.ScrollbarSize       = 15
    style.ScrollbarRounding   = 0
    style.GrabMinSize         = 14
    style.GrabRounding        = 3
    style.WindowTitleAlign    = ImVec2(0, 1)
    style.ButtonTextAlign     = ImVec2(0, 0)

    colors[clr.Text]                 = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]         = ImVec4(0.73, 0.75, 0.74, 1.00)
    colors[clr.WindowBg]             = ImVec4(0.00, 0.00, 0.00, 0.90)
    colors[clr.ChildWindowBg]        = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.PopupBg]              = ImVec4(0.19, 0.12, 0.12, 0.94)
    colors[clr.Border]               = ImVec4(0.20, 0.20, 0.20, 0.50)
    colors[clr.BorderShadow]         = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]              = ImVec4(0.78, 0.77, 0.77, 0.54)
    colors[clr.FrameBgHovered]       = ImVec4(0.84, 0.66, 0.66, 0.40)
    colors[clr.FrameBgActive]        = ImVec4(0.84, 0.66, 0.66, 0.67)
    colors[clr.TitleBg]              = ImVec4(0.35, 0.35, 0.35, 0.91)
    colors[clr.TitleBgActive]        = ImVec4(0.65, 0.65, 0.65, 1.00)
    colors[clr.TitleBgCollapsed]     = ImVec4(0.47, 0.22, 0.22, 0.67)
    colors[clr.MenuBarBg]            = ImVec4(0.34, 0.16, 0.16, 1.00)
    colors[clr.ScrollbarBg]          = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]        = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered] = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]  = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.ComboBg]              = ImVec4(0.20, 0.20, 0.20, 0.99)
    colors[clr.CheckMark]            = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.SliderGrab]           = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.SliderGrabActive]     = ImVec4(0.84, 0.66, 0.66, 1.00)
    colors[clr.Button]               = ImVec4(0.66, 0.57, 0.57, 0.65)
    colors[clr.ButtonHovered]        = ImVec4(0.28, 0.27, 0.27, 0.65)
    colors[clr.ButtonActive]         = ImVec4(0.38, 0.26, 0.26, 1.00)
    colors[clr.Header]               = ImVec4(0.71, 0.39, 0.39, 0.54)
    colors[clr.HeaderHovered]        = ImVec4(0.84, 0.66, 0.66, 0.65)
    colors[clr.HeaderActive]         = ImVec4(0.84, 0.66, 0.66, 0.00)
    colors[clr.Separator]            = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.SeparatorHovered]     = ImVec4(0.71, 0.39, 0.39, 0.54)
    colors[clr.SeparatorActive]      = ImVec4(0.71, 0.39, 0.39, 0.54)
    colors[clr.ResizeGrip]           = ImVec4(0.71, 0.39, 0.39, 0.54)
    colors[clr.ResizeGripHovered]    = ImVec4(0.84, 0.66, 0.66, 0.66)
    colors[clr.ResizeGripActive]     = ImVec4(0.84, 0.66, 0.66, 0.66)
    colors[clr.CloseButton]          = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.CloseButtonHovered]   = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]    = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]            = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]     = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]        = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]       = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.ModalWindowDarkening] = ImVec4(0.80, 0.80, 0.80, 0.35)
    end
end
