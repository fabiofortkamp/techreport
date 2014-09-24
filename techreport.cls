\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techreport}[2014/09/24]

\LoadClass[a4paper,oneside,12pt,article,brazil]{abntex2}

% standard packages for inputing accented characters
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% font setup: use palatino for text and Euler for math
\RequirePackage{mathpazo}
\RequirePackage{eulervm}
\RequirePackage{classico}

% Some fundamental packages, as suggested by abntex2 templates
\RequirePackage{cmap} % map special characters in PDF
\RequirePackage{indentfirst}
\RequirePackage{nomencl}
\RequirePackage{color}
\RequirePackage{graphicx}

% abntex citation
\RequirePackage[alf]{abntex2cite}	% Citações padrão ABNT

% change figure list in Brazilian
\addto\captionsbrazil{
    \renewcommand{\listfigurename}{Lista de figuras}
}
