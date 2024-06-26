/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32; /* snap pixel */

static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */ 

static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = {"fontawesome:size=11", "monospace:size=11" };

static const char dmenufont[]       = "monospace:size=11";

static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#bbbbbb";
static char selfgcolor[]            = "#eeeeee";
static char selbordercolor[]        = "#005577";
static char selbgcolor[]            = "#005577";
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

/* tagging $ "☣"*/
static const char *tags[] = { "", "", "", "", "", "", "", "", ""};


static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask      switchtotag  isfloating   isterminal noswallow monitor */
	{ "Gimp",      NULL,       NULL,       0,            0,           1,           0,         0,        -1 },
	{ "warp-share",NULL,       NULL,       0,            0,           1,           0,         0,        -1 },
	{ "firedragon",  NULL,       NULL,       1 << 8,       1,           0,           0,         0,        -1 },
	{ "thunderbird", NULL,     NULL,       1 << 4,       1,           0,           0,         0,        -1 },
	{ "ArmCord",     NULL,     NULL,       1 << 2,       0,           0,           0,         0,        -1 },
	{ "St",        NULL,       NULL,       0,            0,           0,           1,         0,        -1 },
	{ NULL,   NULL,  "Event Tester",       0,            0,           0,           0,         1,        -1 },
	{ NULL,   NULL,  "ncspot",        1 << 3,            1,           0,           0,         0,        -1 },
	{ NULL,   NULL,  "vifm",          1 << 1,            0,           0,           1,         0,        -1 },
	{ "mpv",   NULL,  NULL,           1 << 7,            0,           0,           0,         0,        -1 },
	{ NULL,  "sxiv",  NULL,           1 << 6,            0,           0,           0,         0,        -1 },
};
/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"



static const Layout layouts[] = {
 	/* symbol     arrange function */
 	{ "[]=",      tile },    /* first entry is default */
 	{ "><>",      NULL },    /* no layout function means floating behavior */
 	{ "[M]",      monocle },
 	{ "[@]",      spiral },
 	{ "[\\]",     dwindle },
 	{ "H[]",      deck },
 	{ "TTT",      bstack },
 	{ "===",      bstackhoriz },
 	{ "HHH",      grid },
 	{ "###",      nrowgrid },
 	{ "---",      horizgrid },
 	{ ":::",      gaplessgrid },
 	{ "|M|",      centeredmaster },
 	{ ">M>",      centeredfloatingmaster },
 	{ NULL,       NULL },
 };

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont};
static const char *termcmd[]  = { "st", NULL };
static const char *playpause[]  = { "playerctl", "play-pause" };
static const char *volupcmd[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+1000", NULL };
static const char *voldowncmd[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-1000", NULL };
static const char *mutevolcmd[] = { "pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle", NULL };
static const char *mutemiccmd[] = { "pactl", "set-source-mute", "@DEFAULT_SOURCE@", "toggle", NULL };
static const char *brightupcmd[] = { "xbacklight", "-inc", "10", NULL };
static const char *brightdowncmd[] = { "xbacklight", "-dec", "10", NULL };
static const char *nextcmd[] = { "playerctl", "next", NULL };
static const char *prevcmd[] = { "playerctl", "previous", NULL };
static const char *lockcmd[] = { "betterlockscreen", "-l", NULL };
static const char *browsercmd[]  = { "firedragon", NULL };
static const char *filemanagercmd[]  = { "st", "./.config/vifm/scripts/vifmrun", NULL };
static const char *ncpsotcmd[]  = { "st", "ncspot", NULL };
static const char *discordcmd[]  = { "armcord", NULL };
static const char *emailcmd[]  = { "thunderbird", NULL };

static const char *selectwindowcmd[] = { "screenshot.sh", "select", NULL };
static const char *selectareacmd[] = { "screenshot.sh", "area", NULL };
static const char *activewindowcmd[] = { "screenshot.sh", "window", NULL };
static const char *fullscreencmd[] = {"screenshot.sh", "full", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
  
  { 0,                       0x1008FF14,      spawn,         {.v = playpause } },
  { 0,                       0x1008FF13,      spawn,         {.v = volupcmd } },
  { 0,                       0x1008FF11,      spawn,         {.v = voldowncmd } },
  { 0,                       0x1008FF12,      spawn,         {.v = mutevolcmd } },
  { 0,                       0x1008FFB2,      spawn,         {.v = mutemiccmd } },
  { 0,                       0x1008FF02,      spawn,         {.v = brightupcmd } },
  { 0,                       0x1008FF03,      spawn,         {.v = brightdowncmd } },
  { 0,                       0x1008FF17,      spawn,         {.v = nextcmd } },
  { 0,                       0x1008FF16,      spawn,         {.v = prevcmd } },

  { 0,                         XK_Print,      spawn,         {.v = activewindowcmd } },
  { MODKEY,                        XK_s,      spawn,         {.v = fullscreencmd } },
  { MODKEY|ShiftMask,              XK_s,      spawn,         {.v = selectareacmd } },
  { MODKEY|ShiftMask,              XK_f,      spawn,         {.v = selectwindowcmd } },

	{ MODKEY|ShiftMask,             XK_l,      spawn,          {.v = lockcmd } },
	{ MODKEY,                       XK_n,      spawn,          {.v = browsercmd } },
	{ MODKEY,                       XK_e,      spawn,          {.v = filemanagercmd } },
	{ MODKEY|ShiftMask,             XK_d,      spawn,          {.v = discordcmd } },
	{ MODKEY|ShiftMask,             XK_m,      spawn,          {.v = emailcmd } },
	{ MODKEY|ShiftMask,             XK_r,      spawn,          {.v = ncpsotcmd } },

	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY|Mod4Mask,              XK_u,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_u,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_i,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_i,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_o,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_o,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_6,      incrihgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_6,      incrihgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_7,      incrivgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_7,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_8,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_8,      incrohgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_9,      incrovgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_9,      incrovgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },

	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} }, /*tile*/
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} }, /*float*/
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} }, /*monocle*/
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[9]} }, /*nrowgrid*/
  { MODKEY,                       XK_u,      setlayout,      {.v = &layouts[5]} }, /*deck*/
  { MODKEY|ShiftMask,             XK_t,      setlayout,      {.v = &layouts[6]} }, /*bstack*/
  { MODKEY,                       XK_o,      setlayout,      {.v = &layouts[12]} }, /*centeredmaster*/
  { MODKEY|ShiftMask,             XK_o,      setlayout,      {.v = &layouts[13]} }, /*centeredfloatingmaster*/

	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_F5,     xrdb,           {.v = NULL } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,	          	XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[1]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

