\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techreport}[2014/09/24]

\RequirePackage{ifthen}

\newboolean{isenglish}
\DeclareOption{english}{\setboolean{isenglish}{true}}

\DeclareOption*{%
 \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax

\LoadClass[a4paper,oneside,12pt,article]{abntex2}

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
\ifthenelse{\boolean{isenglish}}{%
\RequirePackage[alf,abnt-etal-list=0,abnt-and-type=&]{abntex2cite}}{%
\RequirePackage[alf,abnt-etal-list=0]{abntex2cite}}	% Citações padrão ABNT

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
    \pagestyle{simple}% no chapter names, to avoid priting "Summary" and "References"
  }{%else  
    \pagestyle{abntheadings}%
    \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  }  
  \nouppercaseheads%
  \bookmarksetup{startatroot}% 
}

\ifthenelse{\boolean{isenglish}}{}{%
\renewcommand{\equationautorefname}{Equação}%
\renewcommand{\figureautorefname}{Figura}%
\renewcommand{\tableautorefname}{Tabela}}

% table of contents formatting
\ifthenelse{%
\equal{\ABNTEXisarticle}{true}}%
{%
\cftsetindents{section}{0em}{1em}
\cftsetindents{subsection}{1em}{2em}
\cftsetindents{subsubsection}{2em}{3em}
\renewcommand{\cftchapterfont}{\ABNTEXchapterfont}
\renewcommand{\cftsectionfont}{\ABNTEXsectionfont}
\renewcommand{\cftsubsectionfont}{\ABNTEXsubsectionfont}
\renewcommand{\cftsubsubsectionfont}{\ABNTEXsubsubsectionfont}%
\renewcommand{\bibsection}{%
    \chapter*{\bibname}
    \bibmark
    \ifnobibintoc\else
    \addcontentsline{toc}{section}{\bibname}
    \fi
    \prebibhook
}%
}{}


