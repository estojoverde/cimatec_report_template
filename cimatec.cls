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
\usepackage[english,main=brazilian]{babel} %enables brazilian portuguese
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
\usepackage{rotating} %for rotating tables
\usepackage{placeins}
% \usepackage{abstract}
\usepackage[acronym]{glossaries} %might use [toc] option to appear in table of contents


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
\usepackage{subcaption}
\makeatletter
\@ifpackageloaded{subfig}
    {\usepackage[titles,subfigure]{tocloft}}
    {\usepackage[titles]{tocloft}}
\makeatother

\usepackage{etoolbox} % allows boolean logic inside model

%\usepackage{titletoc} %enables toc personalization

% %%%%%% GENERAL SETTINGS %%%%%%


\newcommand{\CTsetDocumentLevel}[1]{
    
     % \gdef\CTMsealpath{CTsettings/figures/seal_confidential.png}

     % \gdef\CTMDocumentLevel{#1}
     % %\gdef\CTMDocumentLevel\CTDocumentLevel
     % \PackageWarning{CTsetDocumentLevel}{LABEL CHOSEM? Path= \"\CTMsealpath\" - LEVEL: \CTMDocumentLevel }
  % \edef\lowercaselevel\lowercase{#1}%
  % \PackageWarning{CTsetDocumentLevel}{LABEL \lowercase{#1}  #1  }

  \def\inputlevel{#1}%
  
  
  \expandafter\ifstrequal\expandafter{\inputlevel}{public}{%
     \gdef\CTMsealpath{CTsettings/figures/seal_public.png}
     \gdef\CTMDocumentLevel{\inputlevel}
  }{%?
    \expandafter\ifstrequal\expandafter{\inputlevel}{restricted}{%
       \gdef\CTMsealpath{CTsettings/figures/seal_restricted.png}
       \gdef\CTMDocumentLevel{\inputlevel}
     }{%?
        \expandafter\ifstrequal\expandafter{\inputlevel}{internal}{%
           \gdef\CTMsealpath{CTsettings/figures/seal_internal.png}
           \gdef\CTMDocumentLevel{\inputlevel}
         }{%?
            \expandafter\ifstrequal\expandafter{\inputlevel}{confidential}{%
               \gdef\CTMsealpath{CTsettings/figures/seal_confidential.png}
               \gdef\CTMDocumentLevel{\inputlevel}
             }{%?
                 \gdef\CTMsealpath{CTsettings/figures/seal_confidential.png}
                 \gdef\CTMDocumentLevel{confidential}
                 \PackageWarning{CTsetDocumentLevel}{DEFAULT LABEL IS CONFIDENTIAL }
             
             }
         
         }
     
     }
  }
%debug
  %\PackageWarning{CTsetDocumentLevel}{CHOSEN LABEL: \CTMDocumentLevel }
}
    

% %     \ifstrequal{#1}{internal}{%
% %       \gdef\CTMsealpath{"/CTsettings/figures/seal_internal.png"}
% %       \def\CTDocumentLevel{#1}
% %     }{%
% %       \ifstrequal{#1}{restricted}{%
% %         \gdef\CTMsealpath{"/CTsettings/figures/seal_restricted.png"}
% %         \def\CTDocumentLevel{#1}
% %       }{%
% %          \ifstrequal{#1}{confidential}{%
% %             \gdef\CTMsealpath{"/CTsettings/figures/seal_confidential.png"}
% %             \def\CTDocumentLevel{#1}
% %          }{%
% %             \PackageWarning{\CTsetDocumentLevel}{UNRECOGNIZED LEVEL. It can be public, internal, restricted or confidential. }
% %             \def\CTDocumentLevel{NONE}
% %          }%
% %       }%
% %     }%
% %   }%
%    \PackageWarning{\CTsetDocumentLevel}{LABEL CHOSEM? \CTDocumentLevel - \CTMsealpath }
% }

    




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


\gdef\CTMclient{} %sets SAP to empty
\def\CTclient#1{\gdef\CTMclient{#1}} %sets SAP to the given argument


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
    




%%%% COLOR SETTINGS %%%%
\definecolor{title-block-color}{RGB}{0,32,96}
\definecolor{date-block-color}{RGB}{92,136,169}
\definecolor{RoyalBlue}{RGB}{65, 105, 225}
\definecolor{WhiteIce}{RGB}{240,240,230}




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
\def\CTAUXchapterfont{\fontsize{20}{20}\color{RoyalBlue}}
\chapterfont{\CTAUXchapterfont}  % sets colour of chapters
\sectionfont{\fontsize{18}{18}\selectfont\color{RoyalBlue}}  % sets colour of sections
\subsectionfont{\fontsize{16}{16}\color{RoyalBlue}}
\subsubsectionfont{\fontsize{16}{16}\color{RoyalBlue}}

\setlength{\oddsidemargin}{20 pt}
\setlength{\textwidth}{450 pt}
\setlength{\headsep}{55 pt}
\setlength{\textheight}{0.9\textheight}

\renewcommand{\familydefault}{\sfdefault} %sets default font to sans serif

\newcommand{\CTtitlefontstyle}[1]{%
\fontsize{25}{25}\color{RoyalBlue}\textbf{#1}%
}


%%%% LANGUAGE SETTINGS %%%%




%%%% ABSTRACT SETTINGS %%%%

% Define the CTabstractBase command
\newcommand{\CTabstractBase}[3]{%
    \begin{center}
    \chapter*{\MakeUppercase{#1}}
    \addcontentsline{toc}{chapter}{\MakeUppercase{#1}}

    % Check the second argument for conditional formatting
    \ifthenelse{\equal{#2}{english}}{%
        \selectlanguage{english}
    }{%
        % Do nothing
    }
    
    % The abstract text
    \emph{#3}
    \end{center}
}

% Define the CTresumo command
\newcommand{\CTresumo}[1]{%
    \CTabstractBase{Resumo}{brazilian}{#1}
}

% Define the CTabstract command
\newcommand{\CTabstract}[1]{%
    \CTabstractBase{Abstract}{english}{#1}
    \selectlanguage{brazilian}
}




% \begin{CTabstract}{RESUMO}
% \lipsum[1-2]
% \end{CTabstract}

% \begin{CTabstract}{ABSTRACT}[english]
% \lipsum[2-3]
% \end{CTabstract}




%%%% PAGE LAYOUT SETTINGS %%%%



% creates a new page style with page number on the right
% \fancypagestyle{CTstylewithpage}{%
%   \fancyhf{} % Clear all header and footer fields
%   \renewcommand{\headrulewidth}{0pt} % Remove header rule
%   \renewcommand{\footrulewidth}{0pt} % Remove footer rule

%   \setlength{\headheight}{28pt} % Set headheight to satisfy fancyhdr warning
%   \addtolength{\topmargin}{-2.5pt} % Adjust topmargin to compensate

  
%   \fancyfoot[L]{%
%     \color{RoyalBlue}\CTMsenaiaddress
%   } % Left footer content
%   \fancyfoot[R]{%
%     \color{RoyalBlue}{\textbf{www.senaicimatec.com.br}\\
%     Página \thepage\ de \pageref*{LastPage}}%
%   } % Right footer content
%   \fancyfoot[C]{%
%     \vtop{\vskip-18pt\hbox{\includegraphics[width=2cm]{\CTMsealpath}}}
%       % @BUG  / POTENTIAL BUG HERE:
%         % It should get margins from global variables, but I cant make it work. So, I'm doing it manually.
%       % \fancyhead[C]{\vspace{0.2cm}\tikz[overlay,remember picture]\draw[RoyalBlue,line width=1pt] (current page.north west) ++ (\the\oddsidemargin,-2m) -- ++ (\textwidth,0);}
%       % \fancyhead[C]{\vspace{0.2cm}\tikz[overlay,remember picture]\draw[RoyalBlue,line width=1pt] (current page.north west) ++ (-\oddsidemargin,-0.5cm) -- ++ (\textwidth,0);}
%     \tikz[overlay,remember picture]\draw[RoyalBlue,line width=1pt] (current page.south west) ++ (2.4cm,3cm) -- ++ (\textwidth,0);
%   } % Center footer content

%   \fancyheadoffset{0.03 cm}
%   \fancyhead[L]{
%     \begin{picture}
%     (0,0)\put(0,-18pt){\includegraphics[width=3.5cm]{CTsettings/figures/senai_logo.png}} 
%     \end{picture}
%   }

%   \fancyhead[C]{\tikz[overlay,remember picture]\draw[RoyalBlue,line width=1pt] (current page.north west) ++ (2.4cm,-2cm) -- ++ (\textwidth,0);}
% }

% creates a new page style without page number
\fancypagestyle{CTstylenopage}{%
  \fancyhf{} % Clear all header and footer fields
  \renewcommand{\headrulewidth}{0pt} % Remove header rule
  \renewcommand{\footrulewidth}{0pt} % Remove footer rule

  \setlength{\headheight}{28pt} % Set headheight to satisfy fancyhdr warning
  \addtolength{\topmargin}{-2.5pt} % Adjust topmargin to compensate

  
  \fancyfoot[L]{%
    \color{RoyalBlue}\CTMsenaiaddress
  } % Left footer content
  \fancyfoot[R]{%
    \color{RoyalBlue}{\textbf{www.senaicimatec.com.br}}
  } % Right footer content
  \fancyfoot[C]{%
    \vtop{\vskip-18pt\hbox{\includegraphics[width=2cm]{\CTMsealpath}}}
      % @BUG  / POTENTIAL BUG HERE:
        % It should get margins from global variables, but I cant make it work. So, I'm doing it manually.
      % \fancyhead[C]{\vspace{0.2cm}\tikz[overlay,remember picture]\draw[RoyalBlue,line width=1pt] (current page.north west) ++ (\the\oddsidemargin,-2m) -- ++ (\textwidth,0);}
      % \fancyhead[C]{\vspace{0.2cm}\tikz[overlay,remember picture]\draw[RoyalBlue,line width=1pt] (current page.north west) ++ (-\oddsidemargin,-0.5cm) -- ++ (\textwidth,0);}
    \tikz[overlay,remember picture]\draw[RoyalBlue,line width=1pt] (current page.south west) ++ (2.4cm,3cm) -- ++ (\textwidth,0);
  } % Center footer content

  \fancyheadoffset{0.03 cm}
  \fancyhead[L]{
    \begin{picture}
    (0,0)\put(0,-18pt){\includegraphics[width=3.5cm]{CTsettings/figures/senai_logo.png}} 
    \end{picture}
  }

  \fancyhead[C]{\tikz[overlay,remember picture]\draw[RoyalBlue,line width=1pt] (current page.north west) ++ (2.4cm,-2cm) -- ++ (\textwidth,0);}

    \AddToShipoutPictureBG{\color{RoyalBlue}
    \AtPageLowerLeft{\rule{\dimexpr 1in -\marginparsep\relax}{\paperheight}}}
}



%creates a new page style with page number on the right
\fancypagestyle{CTstylewithpage}{%
  \pagestyle{CTstylenopage}
  \fancyfoot[R]{%
    \color{RoyalBlue}{\textbf{www.senaicimatec.com.br}\\
    Página \thepage\ de \pageref*{LastPage}}%
  } % Right footer content
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
\DTLnewdb{CTrevisionsDB}

\newcommand{\CTrevision}[4]{ {
	\DTLnewrow{CTrevisionsDB}%
	\DTLnewdbentry{CTrevisionsDB}{date}{#1}%
	\DTLnewdbentry{CTrevisionsDB}{version}{#2}%
	\DTLnewdbentry{CTrevisionsDB}{desc}{#3}%
	\DTLnewdbentry{CTrevisionsDB}{author}{#4}%
} }


\def\CTmakerevsection{
	\pagenumbering{gobble}
        \vspace{2cm}
        {\noindent\CTtitlefontstyle{Histórico de Revisões}}\\
	\begin{center}
		\vspace*{0.5 cm}
            \small{
		\begin{tabular}{| m{2cm} | m{1.4cm} | m{4.5cm} |  m{4cm} |}
			\hline
			\rowcolor[HTML]{9B9B9B}
			\centering \bfseries Data & \centering \textbf{Versão} & \centering \textbf{Descrição} & \centering \textbf{Autor(es)}  \tabularnewline
			\hline                  
			\DTLforeach{CTrevisionsDB}{\revdate=date, \revversion=version, \revdesc=desc, \revauthor=author}{
                    \ifthenelse{\value{DTLrowi}<\DTLrowcount{CTrevisionsDB}}{\centering \revdate & \centering \revversion & \revdesc & {\tiny  \revauthor} \tabularnewline \hline}
                    {}}
                \centering \revdate & \revversion & \revdesc & \revauthor \tabularnewline \hline
		\end{tabular}}
	\end{center}
	\clearpage
}


%% SYMBOLS DATABASE SETTINGS %%
\DTLnewdb{CTsymbolsDB}

\newcommand{\CTsymbolinput}[2]{{
	\DTLnewrow{CTsymbolsDB}%
	\DTLnewdbentry{CTsymbolsDB}{CTsymrow}{#1}%
	\DTLnewdbentry{CTsymbolsDB}{CTdescrow}{#2}%
}}


\def\CTmakesymbolsection{
	\pagenumbering{gobble}
        \vspace{2cm}
        % {\Huge \CTAUXchapterfont{\MakeUppercase{Lista de Símbolos}}}\\
        % \hspace{-20pt}
        \noindent{\CTtitlefontstyle{Lista de Símbolos}}\\
	\begin{center}
		\vspace*{0.5 cm}
            \small
            \rowcolors{1}{WhiteIce}{white}
		\begin{tabular}{| m{10cm} | m{6cm} |}
			\hline
			\rowcolor[HTML]{9B9B9B}
			\centering \textbf{Símbolo} & \centering \textbf{Descrição} \tabularnewline
			\hline                  
			\DTLforeach{CTsymbolsDB}{\CTsymsymbol=CTsymrow, \CTsymdesc=CTdescrow}{
                    \ifthenelse{\value{DTLrowi}<\DTLrowcount{CTsymbolsDB}}{\centering \CTsymsymbol & \centering \CTsymdesc \tabularnewline \hline}
                    {}}
                \centering \CTsymsymbol & \centering \CTsymdesc \tabularnewline \hline
		\end{tabular}
	\end{center}
	\clearpage
}


% \def\CTmakesymbolsection{
%         \newpage
% 	\pagenumbering{gobble}
%         \vspace{2cm}
%         {\Huge \CTAUXchapterfont{\MakeUppercase{Lista de Símbolos}}}\\
% 	\begin{center}
% 		\vspace*{0.5 cm}
%             \small{
% 		\begin{tabular}{| m{4cm} | m{6cm} |}
% 			\hline
% 			\rowcolor[HTML]{9B9B9B}
% 			\centering \textbf{Símbolo} & \centering \textbf{Descrição} \tabularnewline
% 			\hline                  
% 			\DTLforeach{CTsymbolsDB}{\CTsymsymbol=symbol, \CTsymdesc=description}{
%                     \ifthenelse{\value{DTLrowi}<\DTLrowcount{CTsymbolsDB}}{\centering \CTsymsymbol & \centering \CTsymdesc \tabularnewline \hline}
%                     {}}
%                 \centering \CTsymsymbol & \CTsymdesc \tabularnewline \hline
% 		\end{tabular}}
% 	\end{center}
% 	\clearpage
% }






%%%% INFO PAGE SETTINGS %%%%
\def\CTmakeinfopage{
    \newpage
    \thispagestyle{CTstylenopage}
    
    { \noindent\CTtitlefontstyle{\CTMdocumenttype} \\}
    \vspace*{0.5 cm}
    \begin{table}[H]
        \centering
       \begin{tabular}{ |p{4cm}|p{10cm}|  }
     \hline
    Projeto & \CTMprojectname \\ \hline
    Tipo de Documento & \CTMdocumenttype \\ \hline
    Cliente/Empresa & \CTMclient \\ \hline
    Escrito por & \CTMauthors \\ \hline
    Líder Técnico & \CTMtechleader \\ \hline
    Gerente de Projetos & \CTMprojectmanager \\ \hline
    Revisado por & \CTMreviewedby \\ \hline
    Aprovado por & \CTMapprovedby \\ \hline
    
    \end{tabular}
    \end{table}

    \CTmakerevsection
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
            \includegraphics[width=\paperwidth,height=\paperheight]
                {CTsettings/figures/front_cover_2.png}
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


%% ALGORITHMS SETTINGS %%
\renewcommand{\lstlistingname}{Algoritmo}% Listing -> Algorithm
\renewcommand{\lstlistlistingname}{Lista de Algoritmos}


\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\lstdefinestyle{CTalgorithmstyle}{
  backgroundcolor=\color{backcolour}, commentstyle=\color{codegreen},
  keywordstyle=\color{magenta},
  numberstyle=\tiny\color{codegray},
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false,         
  breaklines=true,                 
  captionpos=b,                    
  keepspaces=true,                 
  numbers=left,                    
  numbersep=5pt,                  
  showspaces=false,                
  showstringspaces=false,
  showtabs=false,                  
  tabsize=2
}
\lstset{style=CTalgorithmstyle}


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

\let\oldcite\cite
\renewcommand{\cite}[1]{\citet{#1}}


%% DRAFT MODE SETTINGS %%
% \newbool{CTdraftmode}

% \ifbool{CTdraftmode}{%
%     % Draft mode is enabled
%     \let\oldincludegraphics\includegraphics
%     \renewcommand{\includegraphics}[2][]{%
%     \oldincludegraphics[resolution=30, #1]{#2}%
%     }
% }{%
%     % Draft mode is disabled
% }

% % \boolfalse{CTdraftmode} % by default, not in draft mode
% \booltrue{CTdraftmode} % by default, in draft mode

% \newcommand{\CTmakeDraft}{\booltrue{CTdraftmode}}
% \newcommand{\CTprintDraftStatus}{%
%     Draft mode is \ifbool{CTdraftmode}{enabled}{disabled}.
% }




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

%simplifies the life of everyone! =] 
\newcommand{\quotes}[1]{``#1''}




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
