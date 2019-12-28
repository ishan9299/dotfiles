static const char norm_fg[] = "#e8d78e";
static const char norm_bg[] = "#120d0d";
static const char norm_border[] = "#a29663";

static const char sel_fg[] = "#e8d78e";
static const char sel_bg[] = "#70472C";
static const char sel_border[] = "#e8d78e";

static const char urg_fg[] = "#e8d78e";
static const char urg_bg[] = "#684525";
static const char urg_border[] = "#684525";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
