\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techreport}[2014/12/12 v0.3]

\LoadClass[a4paper,oneside,12pt,article,brazil]{abntex2}

% standard packages for inputing accented characters
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% font setup: use palatino 
% there seems to be a bug with using Palatino and amsmath, because they both define a command \iint
% I'm using a solution from the TeX UK FAQ (http://www.tex.ac.uk/cgi-bin/texfaq2html?label=alreadydef)
% with this, I'm alreding loading amsmath, which is useful sometimes

\RequirePackage{savesym}
\RequirePackage{amsmath}
\savesymbol{iint}

\RequirePackage{pxfonts}

%the pxfonts version can be invoked via \PXFiint
\restoresymbol{PXF}{iint}

% Some fundamental packages, as suggested by abntex2 templates
\RequirePackage{cmap} % map special characters in PDF
\RequirePackage{color}
\RequirePackage{graphicx}

% abntex citation
\RequirePackage[alf,abnt-etal-list=0]{abntex2cite}	% Citações padrão ABNT

% change figure list in Brazilian
\addto\captionsbrazil{
    \renewcommand{\listfigurename}{Lista de figuras}
}

% configure margins
\setlrmarginsandblock{3.0cm}{2.0cm}{*}
\setulmarginsandblock{3.0cm}{2.0cm}{*}
\checkandfixthelayout

% There seems to be no standard on paragraph indentation; I'm using a value that seems reasonable
\setlength{\parindent}{0.75cm}

% Eliminate spacing between parapgrahs
\setlength{\parskip}{0.0cm}

% espaçamento simples
\OnehalfSpacing

% ---
% Modify the \textual command, to print page number at the top right corner
\renewcommand{\textual}{%
  \ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
    \pagestyle{headings}%
  }{%else  
    \pagestyle{abntheadings}%
    \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  }  
  \nouppercaseheads%
  \bookmarksetup{startatroot}% 
}

\renewcommand{\equationautorefname}{Equação}
\renewcommand{\figureautorefname}{Figura}
\renewcommand{\tableautorefname}{Tabela}