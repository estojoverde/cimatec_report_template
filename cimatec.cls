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


%%%% BASIC CONFIGURATION %%%%
\ProvidesClass{cimatec}[2023/09/01] %defines class name and date

% \DeclareOption{onecolumn}{\OptionNotUsed}
% \DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}} %pass options inside [] to report class
\ProcessOptions\relax
\LoadClass{report} %loads report class

\usepackage{silence} % to suppress some annoying warnings
\WarningFilter{latex}{Command \underline has changed}
\WarningFilter{latex}{Command \underbar has changed}




%%%%%% GENERAL PACKAGES %%%%%%
%%%% TEXT PACKAGES %%%%
% \usepackage[scaled]{helvet} %font Helvetica
% \usepackage[scaled]{inconsolata} %font Inconsolata

\usepackage{fontspec}

\usepackage[obeyspaces,hyphens]{url} %enables url and breaks long urls
\usepackage[brazilian]{babel} %enables brazilian portuguese
% \usepackage{microtype} %enables microtype; used for text
\usepackage{hyperref} %enables hyperlinks
\usepackage{sectsty} %used to personalize headings of parts, chapters, sections and so on

%%%% GRAPHICS PACKAGES %%%%
\usepackage[table,xcdraw]{xcolor} %enables table color manipulation
\usepackage{graphicx} %enables advanced graphics
\usepackage{tikz} %enables tikz for drawing figures and diagrams
%\usepackage{subfigure}  %enables subfigures; used for figures; DISABLED BECAUSE IT COLLIDED WITH TOCLOFT
%ALTERNATIVELY, TOCLOFT CAN LOAD IT AS AN OPTION
\usepackage{svg} %enables svg import and manipulation
\usepackage{eso-pic} %enables background picture manipulation


% %%%% FLOAT AND ENVIRONMENT PACKAGES %%%%
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
\usepackage{lastpage} %evaluates last page number



%%%% ENCODING PACKAGES %%%%
\usepackage[T1]{fontenc} %enables font encoding
%\usepackage[utf8]{inputenc} %enables input encoding; NOT NEEDED IN LUALATEX


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
\usepackage{datetime} %allows date and time manipulation
%\usepackage{tocloft} %enables toc personalization
\makeatletter
\@ifpackageloaded{subfig}
    {\usepackage[titles,subfigure]{tocloft}}
    {\usepackage[titles]{tocloft}}
\makeatother

%\usepackage{titletoc} %enables toc personalization

% %%%%%% GENERAL SETTINGS %%%%%%

%%%% CUSTOM GLOBAL VARIABLES %%%%
\gdef\CTMtemplateversion{"1.2"} %sets template version to 1.2
\gdef\CTMtemplatedate{"01/09/2023"} %sets template date to 01/09/2023


\gdef\CTMprojectname{} %sets project name to empty
\def\CTprojectname#1{\gdef\CTMprojectname{#1}} %sets project name to the given argument

\gdef\CTMprojectdescription{} %sets project description to empty
\def\CTprojectdescription#1{\gdef\CTMprojectdescription{#1}} %sets project description to the given argument

\gdef\CTMlegaldept{} %sets legal department to empty
\def\CTlegaldept#1{\gdef\CTMlegaldept{#1}} %sets legal department to the given argument

\gdef\CTMSAP{} %sets SAP to empty
\def\CTSAP#1{\gdef\CTMSAP{#1}} %sets SAP to the given argument

\gdef\CTMtimeperiod{} %sets time period to empty
\def\CTtimeperiod#1{\gdef\CTMtimeperiod{#1}} %sets time period to the given argument

\gdef\CTMprojectmanager{} %sets project manager to empty
\def\CTprojectmanager#1{\gdef\CTMprojectmanager{#1}} %sets project manager to the given argument

\gdef\CTMauthors{} %sets authors to empty
\def\CTauthors#1{\gdef\CTMauthors{#1}} %sets authors to the given argument

\gdef\CTMtechleader{} %sets tech leader to empty
\def\CTtechleader#1{\gdef\CTMtechleader{#1}} %sets tech leader to the given argument

\gdef\CTMreviewedby{} %sets reviewed by to empty
\def\CTreviewedby#1{\gdef\CTMreviewedby{#1}} %sets reviewed by to the given argument

\gdef\CTMreviewdate{} %sets review date to empty
\def\CTreviewdate#1{\gdef\CTMreviewdate{#1}} %sets review date to the given argument

\gdef\CTMapprovedby{} %sets approved by to empty
\def\CTapprovedby#1{\gdef\CTMapprovedby{#1}}    %sets approved by to the given argument

\gdef\CTMapproveddate{} %sets approved date to empty
\def\CTapproveddate#1{\gdef\CTMapproveddate{#1}} %sets approved date to the given argument

\gdef\CTMdocumentversion{} %sets document version to empty
\def\CTdocumentversion#1{\gdef\CTMdocumentversion{#1}} %sets document version to the given argument

\gdef\CTMdocumenttitle{} %sets document title to empty
\def\CTdocumenttitle#1{\gdef\CTMdocumenttitle{#1}} %sets document title to the given argument

\gdef\CTMdocumentsubtitle{} %sets document subtitle to empty
\def\CTdocumentsubtitle#1{\gdef\CTMdocumentsubtitle{#1}} %sets document subtitle to the given argument

\gdef\CTMdocumenttype{} %sets document type to empty
\def\CTdocumenttype#1{\gdef\CTMdocumenttype{#1}} %sets document type to the given argument

\gdef\CTMdepartment{} %sets department to empty
\def\CTdepartment#1{\gdef\CTMdepartment{#1}} %sets department to the given argument

\gdef\CTMdocumentdate{}   %sets document date to empty
\def\CTdocumentdate#1{\gdef\CTMdocumentdate{#1}} %sets document date to the given argument

\gdef\CTMdocumentlocation{} %sets document location to empty
\def\CTdocumentlocation#1{\gdef\CTMdocumentlocation{#1}} %sets document location to the given argument

\gdef\CTMsenaiaddress{} %sets document location to empty
\def\CTsenaiaddress#1{\gdef\CTMsenaiaddress{#1}} %sets document location to the given argument
\CTsenaiaddress{Avenida Orlando Gomes, 1845 \\
    Salvador – Bahia – Brasil\\
    41650-010}
    




% %%%% COLOR SETTINGS %%%%
\definecolor{title-block-color}{RGB}{0,32,96}
\definecolor{date-block-color}{RGB}{92,136,169}
\definecolor{RoyalBlue}{RGB}{65, 105, 225}


%%%% TEXT SETTINGS %%%%
\newcommand{\setcalibrefont}[1]{%
  \setmainfont{Calibre}[
    Path=#1,
    Scale=1,
    Extension=.otf,
    UprightFont=*Regular,
    BoldFont=*Bold,
    ItalicFont=*RegularItalic,
    BoldItalicFont=*BoldItalic
  ]%
}



\renewcommand{\headrulewidth}{0pt}

\renewcommand{\baselinestretch}{1.25} 

\fontsize{12}{15}\selectfont

\partfont{\fontsize{30}{30}\color{RoyalBlue}}  % sets colour of chapters
\chapterfont{\fontsize{20}{20}\color{RoyalBlue}}  % sets colour of chapters
\sectionfont{\fontsize{18}{18}\selectfont\color{RoyalBlue}}  % sets colour of sections
\subsectionfont{\fontsize{16}{16}\color{RoyalBlue}}
\subsubsectionfont{\fontsize{16}{16}\color{RoyalBlue}}

\setlength{\oddsidemargin}{20 pt}
\setlength{\textwidth}{450 pt}
\setlength{\headsep}{55 pt}
\setlength{\textheight}{0.9\textheight}


    
%\DeclareUnicodeCharacter{200B}{{\hskip 0pt}} %enables zero width space character for character U+200B
\renewcommand{\familydefault}{\sfdefault} %sets default font to sans serif


%%%% LANGUAGE SETTINGS %%%%
\renewcommand{\lstlistingname}{Algoritmo}% Listing -> Algorithm


% %%%% PAGE LAYOUT SETTINGS %%%%

    % \textbf{\large \CTMdepartment \CTMdocumentlocation } \\ \\

% \renewcommand{\footrule}{%
% \color{RoyalBlue}
%     \vspace{-8pt}\hrulefill%
%     \hrulefill%
%     \hspace*{-1.7cm}
%   }


% % creates a new page style with page number on the right
\fancypagestyle{CTstylewithpage}{%
  \fancyhf{} % Clear all header and footer fields
  \renewcommand{\headrulewidth}{0pt} % Remove header rule
  \renewcommand{\footrulewidth}{0pt} % Remove footer rule
  \fancyfoot[L]{%
    \color{RoyalBlue}\CTMsenaiaddress
  } % Left footer content
  \fancyfoot[R]{%
    \color{RoyalBlue}{\textbf{www.senaicimatec.com.br}\\
    Página \thepage\ de \pageref*{LastPage}}%
  } % Right footer content
  \fancyfoot[C]{%
    \vtop{\vskip-0.5ex\hbox{\includegraphics[width=2cm]{CTsettings/figures/confidential.png}}}
  } % Center footer content
}
% creates a new page style without page number
\fancypagestyle{CTstylenopage}{%
  \fancyhf{} % Clear all header and footer fields
  \renewcommand{\headrulewidth}{0pt} % Remove header rule
  \renewcommand{\footrulewidth}{0pt} % Remove footer rule
  \fancyfoot[L]{%
    \color{RoyalBlue}\CTMsenaiaddress
  } % Left footer content
  \fancyfoot[R]{%
    \raisebox{0.3cm}{
        \vtop{\color{RoyalBlue}\textbf{www.senaicimatec.com.br}}\hspace*{-1.7cm}
    }
  } % Right footer content
  \fancyfoot[C]{%%enables toc personalization
    \vtop{\vskip-0.5ex\hbox{\includegraphics[width=2cm]{CTsettings/figures/confidential.png}}}
  } % Center footer content
}

% redefine the plain page style, later in document it needs to be redefined again as CTstylewithpage
% e.g.: \fancypagestyle{plain}{\pagestyle{CTstylewithpage}}
\fancypagestyle{plain}{\pagestyle{CTstylenopage}}

%sets page style to plain
\pagestyle{plain} 


%adds confidential to all pages

% % Background content
% \AddToShipoutPictureBG*{%
%   \AtPageLowerLeft{%
%     \includegraphics[width=2cm]{./CTsettings/figures/confidential.png}%
%   }%
% }


%  %sets page geometry specifications
\geometry{
	a4paper, %sets paper size to A4, can be changed to letterpaper, etc.
	textwidth=460pt, %sets text width to 460pt, which is the default for A4 and roughly translates to 16.3 centimeters
	bottom=4cm, %sets bottom margin to 4cm; this is needed to account for the footer
	footskip=1.8cm %sets footskip to 1.8cm; this is needed to account for the footer
}



% % creates a modified version of the \part command that adds part number to chapter numbering
\makeatletter
\newcommand*{\CTpart}[1]{%
  \part{#1}% Call the original \part command with the provided argument
  \ifx\thepart\empty\else
    \renewcommand{\thechapter}{\thepart.\nobreakspace\arabic{chapter}}% Reset chapter numbering with space
  \fi
}
\makeatother


% %%%% DATABASE SETTINGS %%%%

% %% REVISIONS DATABASE SETTINGS %%
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



% %%%% MATH SETTINGS %%%%
\DeclarePairedDelimiter\ceil{\lceil}{\rceil} %forces ceil to be a paired delimiter
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor} %forces floor to be a paired delimiter



% %%%% FRONT PAGE SETTINGS %%%%

\newcommand\CTBGFrontCover{
    \put(0,0){
        \parbox[b][\paperheight]{\paperwidth}{
            \vfill
            \centering
            \includegraphics[width=\paperwidth,height=\paperheight]
                {CTsettings/figures/front_cover.pdf}
            \vfill
        }
    }
}



\def\CTmakefrontpage{
    \pagenumbering{gobble} %suppresses page numbering
    \thispagestyle{empty} %suppresses page number on this page
    
    \fancyhf{} % Clear all header and footer fields
    \renewcommand{\headrulewidth}{0pt} % Remove header rule
    \renewcommand{\footrulewidth}{0pt} % Remove footer rule

    \newgeometry{top=0cm, bottom=0cm, left=0cm, right=0cm}
    
    \newdateformat{monthyeardate}{\THEDAY \ \monthname[\THEMONTH] \THEYEAR} %sets date format to dd month yyyy
    \AddToShipoutPictureBG*{\CTBGFrontCover} %adds background picture to front page
    \newgeometry{top=1cm, bottom=1cm, left=1cm, right=1cm}
    \begin{titlepage}
        \hfill
        %creates a float to encapsulate upper block text, and forces it to the top of the page
        % \begin{float}

        % \PackageWarning{TITLEPAGE}{Debugging warning: Something seems wrong here.}

        \begin{flushright}
          \textcolor{white}{ \fontsize{50}{50} \textbf{ \CTMdocumenttype } \\ }
          \vspace{1cm}
          \textcolor{white}{\fontsize{35}{35}  \textbf{\CTMdocumenttitle } \\ }
          \vspace{0.8cm}
          \textcolor{white}{\fontsize{20}{20} \textbf{  \CTMdocumentsubtitle } \\}
        \end{flushright}        

        \vspace*{\fill}

        \begin{center}
            \textcolor{white}{ \fontsize{18}{18} \textbf{  \CTMdocumentlocation } }
        \end{center}

        \vspace{1cm}

        \begin{center}
            \textcolor{white}{  \fontsize{15}{15} \textbf{  \CTMdocumentdate }}
        \end{center}

        



        
        

            
        % \begin{textblock*}{10cm}(6cm,4cm) % {block width} (coords) 
        %     \raggedleft{
        %     \textcolor{white}{
        %       \textsc{\textbf{ \fontsize{30}{50}\selectfont  \CTMdocumenttype } }\\ 
        %       \textbf{\Huge \CTMdocumenttitle } \\
        %       \textbf{\Large \CTMdocumentsubtitle }
        %     }}
        % \end{textblock*}

        %force distance between upper and lower text blocks
        \vspace{5cm}

        % %puts documentdate at the botton of the page
        % \begin{textblock*}{10cm} % {block width} (coords) 
        %     \noindent
        %     \textcolor{white}{ \textit{\textbf{\large \centering \CTdocumentlocation \\ \CTdocumentdate} } }

        % \end{textblock*}
    \end{titlepage}


    \clearpage
    \newpage
    \restoregeometry
    \restoregeometry
    \pagestyle{plain} 
}


%%%% OTHER SETTINGS %%%%

%% HYPERLINKS SETTINGS %%
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=blue,
    pdftitle={\CTMdocumenttitle},
    pdfpagemode=FullScreen,
    % linktocpage=true, % Link page numbers in table of contents and index
    }

%% TABLE OF CONTENTS SETTINGS %%

% Adjust space between label and entry text
\cftsetindents{chapter}{0em}{2.2em} % Adjust the second value as needed
\cftsetindents{section}{1.5em}{2.8em} % Adjust the second value as needed
\cftsetindents{subsection}{3.8em}{3.6em} % Adjust the second value as needed

% \renewcommand{\cftsecfont}{\color{green}} % Sections
% \renewcommand{\cftsubsecfont}{\color{orange}} % Subsections
% \renewcommand{\cftsubsubsecfont}{\color{red}} % Subsubsections




%% BIBLIOGRAPHY SETTINGS %%

% %Suppress Bibliography Title page
\renewcommand{\bibsection}{}









% %%%%%% GENERAL COMMANDS %%%%%%

% %%%% TEXT COMMANDS %%%%


% %%%% PAGE LAYOUT COMMANDS %%%%

% %%%% DATABASE COMMANDS %%%%

% %%%% MATH COMMANDS %%%%


% %%%% CUSTOM COMMANDS %%%%

% creates a new command for important text;
% e.g.: \importante[red]{texto importante} creates important text in red
% e.g.: \importante[red, name=fulano]{texto importante} creates important text in red with name in brackets
\makeatletter
% Define keys for the keyval package
\define@key{important}{color}{\def\important@color{#1}}
\define@key{important}{name}{\def\important@name{#1}}

\newcommand{\important}[2][]{%
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







% %%%%%% GENERAL MACROS %%%%%%
% %%%% PAGE LAYOUT MACROS %%%%
% %%%% DATABASE MACROS %%%%
% %%%% MATH MACROS %%%%

% %%%%%% CUSTOM MACROS %%%%%%

% %%%%%% GENERAL ENVIRONMENTS %%%%%%
% %%%% PAGE LAYOUT ENVIRONMENTS %%%%
% %%%% DATABASE ENVIRONMENTS %%%%
% %%%% MATH ENVIRONMENTS %%%%

% %%%%%% CUSTOM ENVIRONMENTS %%%%%%
% %%%%%% GENERAL VARIABLES %%%%%%
% %%%% PAGE LAYOUT VARIABLES %%%%
% %%%% DATABASE VARIABLES %%%%
% %%%% MATH VARIABLES %%%%
% %%%%%% CUSTOM VARIABLES %%%%%%
