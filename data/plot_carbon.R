#!/usr/bin/env Rscript

library(reshape2)
library(data.table)
library(argparse)
library(ggplot2)

theme_set(theme_bw(base_size=12) + theme(
    legend.key.size=unit(1, 'lines'),
    text=element_text(face='plain', family='CM Roman'),
    legend.title=element_text(face='plain'),
    axis.line=element_line(color='black'),
    axis.title.y=element_text(vjust=0.1),
    axis.title.x=element_text(vjust=0.1),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.key = element_blank(),
    panel.border = element_blank()
))

parser <- ArgumentParser(description='plot aggregated')
parser$add_argument('input', nargs=1)
parser$add_argument('output', nargs=1)
args <- parser$parse_args()

cross.section <- fread(args$input)[, energy := energy * 1000]
cross.section <- melt(cross.section, id.vars="energy")

print(cross.section)

plot = ggplot(cross.section, aes(x=energy, y=value, colour=factor(variable))) + 
    geom_line() +
    scale_color_brewer(type="qual", palette="Paired") +
    labs(
         x="energy (keV)",
         y="cross section (cm²/g)",
         colour="")

X11(width=14, height=10)
print(plot)
warnings()
#width = 7
#factor = 0.618
#height = width * factor
#ggsave(args$output, plot, width=width, height=height, dpi=300)
invisible(readLines(con="stdin", 1))
