from libqtile import bar, widget, command
from libqtile.config import Screen
from .groups import space
from libqtile.command import lazy
from libqtile import qtile
from .palette import colors as color

os_icon = '    󰙚   '
# 󱗆 󰶵 󰙚  󰌽 

widget_defaults = dict(
    font='JetBrainsMono Nerd Font',
    fontsize=16,
    padding=2,
)
extension_defaults = widget_defaults.copy()

def triangle(fg='#ffffff', bg='#000000', direction='left', shadow=None):
    triangle=''
    if direction == 'left':
        triangle = '   '
    elif direction == 'right':
        triangle = '   '
    return widget.TextBox(
        text=triangle,
        font='JetBrainsMono Nerd Font',
        fontsize=64,
        padding=-13,
        background=bg,
        foreground=fg,
        fontshadow=shadow
    )

def display_groups(visible=[], hide_unused=False, fg='#ff00ff', bg='#00ffff', highlight='#ffff00', active='#ff00ff', inactive='#00ffff', screen='#0000ff'):
    return widget.GroupBox(
        # ~~ Frame ~~
        # Text
        font='FreeSans', # This keep the icons where it goes
        fontsize=27,
        margin=10,
        margin_y=4,
        margin_x=5,
        spacing=None,
        center_aligned=True,
        # Selector
        highlight_method='text',
        padding_y=5,
        padding_x=5,
        borderwidth=0,
        # ~~ Color ~~
            background=bg,
            # Text
            this_current_screen_border=screen,
            this_screen_border='#0025a0',
            other_current_screen_border='#008015',
            other_screen_border='#008015',
            block_highlight_text_color=fg,
            active=active,
            inactive=inactive,
            # Selector
            highlight_color=highlight,
        # ~~ Extra ~~
        disable_drag=True,
        visible_groups=visible,
        hide_unused=hide_unused
    )


screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.TextBox(
                    text=os_icon,
                    font='JetBrainsMono Nerd Font',
                    fontsize=27,
                    padding=7,
                    foreground=color['dices'],
                    background=color['gray0'],
                    fontshadow='#101010',
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('rofi -combi-modi window,drun,ssh -show window -theme ~/.config/rofi/launchers/type-3/style-9.rasi')}
                ),
                triangle(color['gray0'], color['bg'], 'right', shadow=color['black']),
                display_groups([space[0], space[1], space[2]],
                    bg=color['bg'],
                    fg=color['almost black'],
                    active=color['dices'],
                    inactive=color['gray0'],
                    highlight=color['gray3'],
                    screen=color['screen1a'],
                    hide_unused=False
                ),
                triangle(color['bg'], color['bg'], 'right', shadow=color['black']),
                display_groups([space[3], space[4], space[5]],
                    bg=color['bg'],
                    fg=color['fg'],
                    active=color['dices'],
                    inactive=color['gray0'],
                    highlight=color['bg'],
                    screen=color['screen1a'],
                    hide_unused=False
                ),
                triangle(color['bg'], color['bg'], 'right', shadow=color['black']),
                display_groups([space[6], space[7], space[8]],
                    bg=color['bg'],
                    fg=color['almost black'],
                    active=color['dices'],
                    inactive=color['gray0'],
                    highlight=color['gray3'],
                    screen=color['screen1a'],
                    hide_unused=False
                ),
                triangle(color['bg'], color['bg'], 'right', shadow=color['black']),

                widget.TextBox(text='  '),
                widget.CurrentLayoutIcon(foreground='#ffffff', background=color['bg'], scale=0.8, padding=2 ),
                widget.Prompt(
                    font='CaskaydiaCove Nerd Font Mono',
                    fontsize=15,
                    padding=0,
                    prompt='  (>_ ',
                    fmt='{} ) ',
                    foreground=color['almost white'],
                    cursor_color=color['almost white'],
                    background=color['bg'],
                    cursorblink=0.3,
                    ignore_dups_history=True,
                    record_history=False,
                    visual_bell_time=1,
                    bell_style=None
                ),
                triangle(color['bg'], color['bg'], 'right', shadow='#000000'),

                widget.Spacer(length=10),
                widget.WindowName(
                    font='CaskaydiaCove Nerd Font Mono',
                    foreground=color['white'],
                    fontsize=13,
                    padding=100,
                    max_chars=40
                ),
                widget.Sep(),
                widget.Systray(padding=5),
                widget.Spacer(length=0),
                widget.TextBox(
                    text='󰌌    ',
                    font='sans',
                    fontsize=20,
                ),
                widget.KeyboardLayout(
                    font='CaskaydiaCove Nerd Font Mono',
                    configured_keyboards=['us', 'es', 'latam']
                ),
                widget.TextBox(
                    text='    ',
                    font='sans',
                    fontsize=20,
                ),
                widget.CheckUpdates(
                    font='UbuntuMono Nerd Font',
                    no_update_string='0',
                    display_format='{updates}',
                    update_interval=1800,
                    custom_command='checkupdates',
                ),
                widget.Spacer(length=10),
                widget.Sep(),
                widget.Clock(
                    font='CaskaydiaCove Nerd Font Mono',
                    fontsize=20,
                    format='%H:%M %a %d/%m/%Y',
                    foreground=color['white'],
                    padding=10
                ),
            ],
            38,
            opacity=1,
            margin=0,
            background='#21252B',
            border_width=[0, 0, 0, 0],
            border_color=[color['bg'], '000000', color['bg'], '000000']
        ),
    ),
    Screen(
        bottom=bar.Bar(
            [
                widget.TextBox(
                    text=os_icon,
                    font='JetBrainsMono Nerd Font',
                    fontsize=27,
                    padding=7,
                    foreground=color['dices'],
                    background=color['gray0'],
                    fontshadow='#101010',
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('rofi -combi-modi window,drun,ssh -show window -theme ~/.config/rofi/launchers/type-3/style-9.rasi')}
                ),
                triangle(color['gray0'], color['bg'], 'right', shadow=color['black']),
                display_groups([space[0], space[1], space[2]],
                    bg=color['bg'],
                    fg=color['almost black'],
                    active=color['dices'],
                    inactive=color['gray0'],
                    highlight=color['gray3'],
                    screen=color['screen1a'],
                    hide_unused=False
                ),
                triangle(color['bg'], color['bg'], 'right', shadow=color['black']),
                display_groups([space[3], space[4], space[5]],
                    bg=color['bg'],
                    fg=color['fg'],
                    active=color['dices'],
                    inactive=color['gray0'],
                    highlight=color['bg'],
                    screen=color['screen1a'],
                    hide_unused=False
                ),
                triangle(color['bg'], color['bg'], 'right', shadow=color['black']),
                display_groups([space[6], space[7], space[8]],
                    bg=color['bg'],
                    fg=color['almost black'],
                    active=color['dices'],
                    inactive=color['gray0'],
                    highlight=color['gray3'],
                    screen=color['screen1a'],
                    hide_unused=False
                ),
                triangle(color['bg'], color['bg'], 'right', shadow=color['black']),

                widget.TextBox(text='  '),
                widget.CurrentLayoutIcon(foreground='#ffffff', background=color['bg'], scale=0.8, padding=2 ),
                widget.Prompt(
                    font='CaskaydiaCove Nerd Font Mono',
                    fontsize=15,
                    padding=0,
                    prompt='  (>_ ',
                    fmt='{} ) ',
                    foreground=color['almost white'],
                    cursor_color=color['almost white'],
                    background=color['bg'],
                    cursorblink=0.3,
                    ignore_dups_history=True,
                    record_history=False,
                    visual_bell_time=1,
                    bell_style=None
                ),
                triangle(color['bg'], color['bg'], 'right', shadow='#000000'),

                widget.Spacer(length=10),
                widget.WindowName(
                    font='CaskaydiaCove Nerd Font Mono',
                    foreground=color['white'],
                    fontsize=13,
                    padding=100,
                    max_chars=40
                ),
                widget.Sep(),
                widget.Spacer(length=0),
                widget.TextBox(
                    text='󰌌    ',
                    font='sans',
                    fontsize=20,
                ),
                widget.KeyboardLayout(
                    font='CaskaydiaCove Nerd Font Mono',
                    configured_keyboards=['us', 'es', 'latam']
                ),
                widget.Spacer(length=10),
                widget.Sep(),
                widget.Clock(
                    font='CaskaydiaCove Nerd Font Mono',
                    fontsize=20,
                    format='%H:%M %a %d/%m/%Y',
                    foreground=color['white'],
                    padding=10
                ),
            ],
            38,
            opacity=1,
            margin=0,
            background='#21252B',
            border_width=[0, 0, 0, 0],
            border_color=[color['bg'], '000000', color['bg'], '000000']
        ),
    ),
]
