{ ... }:

{
  xdg.dataFile."fcitx5/rime/default.custom.yaml".text = ''
    patch:
      __include: rime_ice_suggestion:/
  '';

  xdg.configFile."fcitx5/conf/classicui.conf".text = ''
    # 垂直候选列表
    Vertical Candidate List=False

    # 使用鼠标滚轮翻页
    WheelForPaging=True

    # 字体
    # Font="Noto Sans CJK SC 10"

    # 菜单字体
    # MenuFont="Noto Sans CJK SC 10"

    # 托盘字体
    # TrayFont="Noto Sans CJK SC Bold 10"

    # 托盘标签轮廓颜色
    TrayOutlineColor=#000000

    # 托盘标签文本颜色
    TrayTextColor=#ffffff

    # 优先使用文字图标
    PreferTextIcon=False

    # 在图标中显示布局名称
    ShowLayoutNameInIcon=True

    # 使用输入法的语言来显示文字
    UseInputMethodLanguageToDisplayText=True

    # 主题
    Theme=catppuccin-latte-pink

    # 深色主题
    DarkTheme=catppuccin-mocha-pink

    # 跟随系统浅色/深色设置
    UseDarkTheme=True

    # 当被主题和桌面支持时使用系统的重点色
    UseAccentColor=False

    # 在 X11 上针对不同屏幕使用单独的 DPI
    PerScreenDPI=False

    # 固定 Wayland 的字体 DPI
    ForceWaylandDPI=0

    # 在 Wayland 下启用分数缩放
    EnableFractionalScale=True
  '';
}
