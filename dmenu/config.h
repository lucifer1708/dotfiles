static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"JetBrains Mono:size=10:antialias=true:autohint:true",
	"Noto Color Emoji:size=9:antialias=true;autohint:true"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#cdd6f4", "#1e1e2e" },
	[SchemeSel] = { "#1e1e2e", "#89dceb" },
	[SchemeOut] = { "#000000", "#89dceb" },
	[SchemeSelHighlight] = { "#b34700", "#000000" },
	[SchemeNormHighlight] = { "#ff6600", "#000000" },
	[SchemeOutHighlight] = { "#d7d7d7", "#1f2026" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
/* -h option; minimum height of a menu line */
static unsigned int lineheight = 22;
static unsigned int min_lineheight = 8;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
