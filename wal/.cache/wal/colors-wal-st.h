const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#120d0d", /* black   */
  [1] = "#684525", /* red     */
  [2] = "#70472C", /* green   */
  [3] = "#523C50", /* yellow  */
  [4] = "#985D27", /* blue    */
  [5] = "#BC6429", /* magenta */
  [6] = "#DF9C1B", /* cyan    */
  [7] = "#e8d78e", /* white   */

  /* 8 bright colors */
  [8]  = "#a29663",  /* black   */
  [9]  = "#684525",  /* red     */
  [10] = "#70472C", /* green   */
  [11] = "#523C50", /* yellow  */
  [12] = "#985D27", /* blue    */
  [13] = "#BC6429", /* magenta */
  [14] = "#DF9C1B", /* cyan    */
  [15] = "#e8d78e", /* white   */

  /* special colors */
  [256] = "#120d0d", /* background */
  [257] = "#e8d78e", /* foreground */
  [258] = "#e8d78e",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
