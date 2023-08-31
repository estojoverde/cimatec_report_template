%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	MODELO DE RELATÓRIOS - CENTRO DE SUPERCOMPUTAÇÃO SENAI CIMATEC
% 
% AUTORES: Felippe Zacarias, Otávio Vicente Ribeiro
%          
% DATA DE CRIAÇÃO: 21/09/2017
% 
% REVISÕES:
% 	[1.2]
%   Data da Revisão: Set/2023
%   Revisor: Marcelo Oliveira da Silva/HPC
%   Descrição da Revisão:
%   	- Adaptação para novo template. 
%   	- Organização do modelo, facilitando modularição, tanto para 
% manutenção do template, quanto do documento a ser confeccionado em si
% 	[1.1] 
%   Descrição da Revisão:
%   	- Conserto da criação da tabela de revisões
%  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{cimatec}[2023/09/01] %defines class name and date
\LoadClass{report} %loads report class

% \DeclareOption{onecolumn}{\OptionNotUsed}
% \DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}} %pass options inside [] to report class




%%%%%% GENERAL PACKAGES %%%%%%
%%%% TEXT PACKAGES %%%%
\usepackage[scaled]{helvet} %font Helvetica
\usepackage[scaled]{inconsolata} %font Inconsolata
\usepackage[obeyspaces,hyphens]{url} %enables url and breaks long urls
\usepackage[brazilian]{babel} %enables brazilian portuguese
\usepackage{microtype} %enables microtype; used for text
\usepackage{hyperref} %enables hyperlinks

%%%% GRAPHICS PACKAGES %%%%
\usepackage[table,xcdraw]{xcolor} %enables table color manipulation
\usepackage{graphicx} %enables advanced graphics
\usepackage{tikz} %enables tikz for drawing figures and diagrams
\usepackage{subfigure}  %enables subfigures; used for figures
\usepackage{svg} %enables svg import and manipulation
\usepackage{eso-pic} %enables background picture manipulation


%%%% FLOAT AND ENVIRONMENT PACKAGES %%%%
\usepackage{float} %enables float manipulation
\usepackage{caption} %enables caption manipulation
\usepackage{multirow} %enables multirow tables
\usepackage{longtable} %enables long tables; used for tables
\usepackage{array} %enables array manipulation; used for tables




%%%% PAGE LAYOUT PACKAGES %%%%
\usepackage{fancyhdr} %enables advanced header and footer personalization
\usepackage{geometry} %enables page geometry customization
\usepackage{lscape} %enables landscape pages; used for tables
\usepackage{setspace} %enables setspace; used for line spacing
\usepackage{indentfirst} %enables indenting first paragraph
\usepackage{ragged2e} %enables text justification; used for text
\usepackage[absolute]{textpos} %enables absolute positioning of text


%%%% ENCODING PACKAGES %%%%
\usepackage[T1]{fontenc} %enables font encoding
\usepackage[utf8]{inputenc} %enables input encoding


%%%% DATABASE PACKAGES %%%%
\usepackage{datatool} %enables database manipulation


%%%% MATH AND ALGORITHM PACKAGES %%%%
\usepackage{amsmath} %enables advanced math
\usepackage{algorithm} %enables algorithm
\usepackage{algcompatible}  %enables algorithm
\usepackage{amssymb} %enables advanced math symbols
\usepackage{algpseudocode} %enables algorithm pseudocode
\usepackage{pythonhighlight} %enables pythonhighlight
\usepackage{listings} %enables listings manipulation; listings are used for code snippets
\usepackage{listingsutf8} %enables listings with utf8
\usepackage{systeme} %enables system manipulation; used for systems of equations
\usepackage{minted} %enables minted; used for code snippets
\usepackage[most]{tcolorbox}    %enables tcolorbox; used for code snippets
\usepackage{cprotect}   %enables cprotect; used for code snippets
\usepackage{mathtools} %enables advanced math
\usepackage{bm} %enables bold math
\usepackage{nicefrac} %enables nice fractions; advanced fractions manipulation

%%%% BIBLIOGRAPHY PACKAGES %%%%
\usepackage[round]{natbib}  %enables natbib


%%%% OTHER PACKAGES %%%%
\usepackage{latexsym} %enables latex symbols
\usepackage{cite} %enables citation manipulation
\usepackage{textcomp} %enables text symbols
\usepackage{comment} %enables comment manipulation; used for commenting out blocks of text
\usepackage{lipsum} %for gibberish content to fill sections
\usepackage{keyval} %enables key value pairs; used for custom commands



%%%%%% GENERAL SETTINGS %%%%%%

%%%% CUSTOM GLOBAL VARIABLES %%%%
\gdef\@CTtemplateversion{"1.2"} %sets template version to 1.2
\gdef\@CTtemplatedate{"01/09/2023"} %sets template date to 01/09/2023


\gdef\@CTprojectname{} %sets project name to empty
\def\CTprojectname#1{\gdef\@CTprojectname{#1}} %sets project name to the given argument

\gdef\@CTprojectdescription{} %sets project description to empty
\def\CTprojectdescription#1{\gdef\@CTprojectdescription{#1}} %sets project description to the given argument

\gdef\@CTlegaldept{} %sets legal department to empty
\def\CTlegaldept#1{\gdef\@CTlegaldept{#1}} %sets legal department to the given argument

\gdef\@CTSAP{} %sets SAP to empty
\def\CTSAP#1{\gdef\@CTSAP{#1}} %sets SAP to the given argument

\gdef\@CTtimeperiod{} %sets time period to empty
\def\CTtimeperiod#1{\gdef\@CTtimeperiod{#1}} %sets time period to the given argument

\gdef\@CTprojectmanager{} %sets project manager to empty
\def\CTprojectmanager#1{\gdef\@CTprojectmanager{#1}} %sets project manager to the given argument

\gdef\@CTauthors{} %sets authors to empty
\def\CTauthors#1{\gdef\@CTauthors{#1}} %sets authors to the given argument

\gdef\@CTtechleader{} %sets tech leader to empty
\def\CTtechleader#1{\gdef\@CTtechleader{#1}} %sets tech leader to the given argument

\gdef\@CTreviewedby{} %sets reviewed by to empty
\def\CTreviewedby#1{\gdef\@CTreviewedby{#1}} %sets reviewed by to the given argument

\gdef\@CTreviewdate{} %sets review date to empty
\def\CTreviewdate#1{\gdef\@CTreviewdate{#1}} %sets review date to the given argument

\gdef\@CTapprovedby{} %sets approved by to empty
\def\CTapprovedby#1{\gdef\@CTapprovedby{#1}}    %sets approved by to the given argument

\gdef\@CTapproveddate{} %sets approved date to empty
\def\CTapproveddate#1{\gdef\@CTapproveddate{#1}} %sets approved date to the given argument

\gdef\@CTdocumentversion{} %sets document version to empty
\def\CTdocumentversion#1{\gdef\@CTdocumentversion{#1}} %sets document version to the given argument

\gdef\@CTdocumenttitle{} %sets document title to empty
\def\CTdocumenttitle#1{\gdef\@CTdocumenttitle{#1}} %sets document title to the given argument

\gdef\@CTdocumentsubtitle{} %sets document subtitle to empty
\def\CTdocumentsubtitle#1{\gdef\@CTdocumentsubtitle{#1}} %sets document subtitle to the given argument

\gdef\@CTdocumenttype{} %sets document type to empty
\def\CTdocumenttype#1{\gdef\@CTdocumenttype{#1}} %sets document type to the given argument

\gdef\@CTdepartment{} %sets department to empty
\def\CTdepartment#1{\gdef\@CTdepartment{#1}} %sets department to the given argument

\gdef\@CTdocumentdate{}   %sets document date to empty
\def\CTdocumentdate#1{\gdef\@CTdocumentdate{#1}} %sets document date to the given argument

\gdef\@CTdocumentlocation{} %sets document location to empty
\def\CTdocumentlocation#1{\gdef\@CTdocumentlocation{#1}} %sets document location to the given argument







%%%% COLOR SETTINGS %%%%
\definecolor{title-block-color}{RGB}{0,32,96}
\definecolor{date-block-color}{RGB}{92,136,169}

%%%% TEXT AND LANGUAGE SETTINGS %%%%
\DeclareUnicodeCharacter{200B}{{\hskip 0pt}} %enables zero width space character for character U+200B
\renewcommand{\familydefault}{\sfdefault} %sets default font to sans serif
\renewcommand{\lstlistingname}{Algoritmo}% Listing -> Algorithm

%%%% PAGE LAYOUT SETTINGS %%%%




% creates a new page style with page number on the right
\fancypagestyle{CTstylewithpage}{%
    % \fancyhf{}  % Clear all header and footer fields
    \rhead{}
    % \fancyfoot[R]{Page \thepage\ of \pageref*{LastPage}}  % Right footer
    \rfoot{\color{RoyalBlue} \textbf{www.senaicimatec.com.br}\\
Página \thepage\ de \pageref*{LastPage}}
    \lfoot{\color{RoyalBlue} Avenida Orlando Gomes, 1845 \\
    Salvador – Bahia – Brasil\\
    41650-010 }
    \cfoot{\vtop{\vskip-0.5ex\hbox{\includegraphics[width=2.5cm]{settings/figures/confidential.png}}}}
    \renewcommand{\headrulewidth}{0pt}  % No header rule
}

% creates a new page style without page number
\fancypagestyle{CTstylenopage}{%
    % \fancyhf{}  % Clear all header and footer fields
    \rhead{}
    % \fancyfoot[R]{Page \thepage\ of \pageref*{LastPage}}  % Right footer
    \lfoot{\color{RoyalBlue} Avenida Orlando Gomes, 1845 \\
    Salvador – Bahia – Brasil\\
    41650-010 }
    \cfoot{\vtop{\vskip-0.5ex\hbox{\includegraphics[width=2.5cm]{settings/figures/confidential.png}}}}
    \renewcommand{\headrulewidth}{0pt}  % No header rule
}

% redefine the plain page style, later in document it needs to be redefined again as CTstylewithpage
% e.g.: \fancypagestyle{plain}{\pagestyle{CTstylewithpage}}
\fancypagestyle{plain}{\pagestyle{CTstylenopage}}

%sets page style to plain
\pagestyle{plain} 



 %sets page geometry specifications
\geometry{
	a4paper, %sets paper size to A4, can be changed to letterpaper, etc.
	textwidth=460pt, %sets text width to 460pt, which is the default for A4 and roughly translates to 16.3 centimeters
	bottom=4cm, %sets bottom margin to 4cm; this is needed to account for the footer
	footskip=1.8cm %sets footskip to 1.8cm; this is needed to account for the footer
}



% creates a modified version of the \part command that adds part number to chapter numbering
\makeatletter
\newcommand*{\CTpart}[1]{%
  \part{#1}% Call the original \part command with the provided argument
  \ifx\thepart\empty\else
    \renewcommand{\thechapter}{\thepart.\nobreakspace\arabic{chapter}}% Reset chapter numbering with space
  \fi
}
\makeatother


%%%% DATABASE SETTINGS %%%%

%% REVISIONS DATABASE SETTINGS %%
\DTLnewdb{CTrevisions}

\newcommand{\CTrevision}[4]{ {
	\DTLnewrow{CTrevisions}%
	\DTLnewdbentry{CTrevisions}{date}{#1}%
	\DTLnewdbentry{CTrevisions}{version}{#2}%
	\DTLnewdbentry{CTrevisions}{desc}{#3}%
	\DTLnewdbentry{CTrevisions}{author}{#4}%
} }

\def\makerevpage{
	\pagenumbering{gobble}
	\begin{center}
		\vspace*{0.5 cm}
		\large{\textbf{HISTÓRICO DE REVISÕES}} \vspace{1 cm} \\
            \small{
		\begin{tabular}{| m{1.6cm} | m{0.9cm} | m{6cm} |  m{5cm} |}
			\hline
			\rowcolor[HTML]{9B9B9B}
			\centering \bfseries Data & \centering \textbf{Versão} & \centering \textbf{Descrição} & \centering \textbf{Autor(es)}  \tabularnewline
			\hline                  
			\DTLforeach{CTrevisions}{\revdate=date, \revversion=version, \revdesc=desc, \revauthor=author}{
                    \ifthenelse{\value{DTLrowi}<\DTLrowcount{CTrevisions}}{\centering \revdate & \revversion & \revdesc & \revauthor \tabularnewline \hline}
                    {}}
                \centering \revdate & \revversion & \revdesc & \revauthor \tabularnewline \hline
		\end{tabular}}
	\end{center}
	\clearpage
}



%%%% MATH SETTINGS %%%%
\DeclarePairedDelimiter\ceil{\lceil}{\rceil} %forces ceil to be a paired delimiter
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor} %forces floor to be a paired delimiter



%%%% FRONT PAGE SETTINGS %%%%

\newcommand\CTBGFrontCover{
    \put(0,0){
        \parbox[b][\paperheight]{\paperwidth}{
            \vfill
            \centering
            \includegraphics[width=\paperwidth,height=\paperheight,
                keepaspectratio]{template_setup/template_figures/front_cover.pdf}
            \vfill
        }
    }
}



\def\CTmakefrontpage{
    \pagenumbering{gobble} %suppresses page numbering
    \thispagestyle{partfancynopage} %suppresses page number on this page
    \newdateformat{monthyeardate}{\THEDAY \ \monthname[\THEMONTH] \THEYEAR} %sets date format to dd month yyyy
    \AddToShipoutPictureBG*{\CTBGFrontCover} %adds background picture to front page
    \begin{titlepage}
        \hfill
        %creates a float to encapsulate upper block text, and forces it to the top of the page
        \begin{float}

        
        
        \begin{textblock*}{10cm}(3cm,4cm) % {block width} (coords) 
            \noindent
            \textcolor{white}{ \textit{\textbf{\huge \CTdocumenttype} \\ \\
            \textbf{\Huge \CTdocumenttitle } \\ \\
            \textbf{\Large \CTdocumentsubtitle } \\ \\
            \textbf{\large \CTdepartment \CTdocumentlocation } \\ \\
            }} 
        \end{textblock*}

        %force distance between upper and lower text blocks
        \vspace{5cm}

        %puts documentdate at the botton of the page
        \begin{textblock*}{10cm}(3cm,19.5cm) % {block width} (coords) 
            \noindent
            \textcolor{white}{ \textit{\textbf{\large \CTdocumentdate} } }

        \end{textblock*}
    \end{titlepage}


    \clearpage
    \newpage
    \mbox{~}
    \clearpage
    \newpage
}



%%%% BIBLIOGRAPHY SETTINGS %%%%

%Suppress Bibliography Title page
\renewcommand{\bibsection}{}









%%%%%% GENERAL COMMANDS %%%%%%

%%%% TEXT COMMANDS %%%%


%%%% PAGE LAYOUT COMMANDS %%%%

%%%% DATABASE COMMANDS %%%%

%%%% MATH COMMANDS %%%%


%%%% CUSTOM COMMANDS %%%%

% creates a new command for important text;
% e.g.: \importante[red]{texto importante} creates important text in red
% e.g.: \importante[red, name=fulano]{texto importante} creates important text in red with name in brackets
\makeatletter
% Define keys for the keyval package
\define@key{important}{color}{\def\important@color{#1}}
\define@key{important}{name}{\def\important@name{#1}}

\newcommand{\importante}[2][]{%
  % Set default values for keys
  \def\important@color{red}
  \def\important@name{}
  % Process provided keys
  \setkeys{important}{#1}
  
  \ifx\important@name\@empty
    {\color{\important@color}\bfseries\Large\MakeUppercase{#2}}%
  \else
    {\color{\important@color}[\important@name]\bfseries\Large\MakeUppercase{#2}}%
  \fi
}
\makeatother







%%%%%% GENERAL MACROS %%%%%%
%%%% PAGE LAYOUT MACROS %%%%
%%%% DATABASE MACROS %%%%
%%%% MATH MACROS %%%%

%%%%%% CUSTOM MACROS %%%%%%

%%%%%% GENERAL ENVIRONMENTS %%%%%%
%%%% PAGE LAYOUT ENVIRONMENTS %%%%
%%%% DATABASE ENVIRONMENTS %%%%
%%%% MATH ENVIRONMENTS %%%%

%%%%%% CUSTOM ENVIRONMENTS %%%%%%
%%%%%% GENERAL VARIABLES %%%%%%
%%%% PAGE LAYOUT VARIABLES %%%%
%%%% DATABASE VARIABLES %%%%
%%%% MATH VARIABLES %%%%
%%%%%% CUSTOM VARIABLES %%%%%%
