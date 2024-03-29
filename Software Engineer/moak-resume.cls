%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jordan Moak  Resume/CV Class
% Edited from a template on 10/22/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{moak-resume}[2021/08/15 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\usepackage{fontawesome5}
\RequirePackage[math-style=TeX]{unicode-math}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ifthen}
\RequirePackage{parskip}
\RequirePackage{tikz}


%%%%%%%%%%
% Colors %
%%%%%%%%%%
\definecolor{white}{RGB}{255,255,255}
\definecolor{black}{HTML}{18101f}
\definecolor{darkgray}{HTML}{5e5e5e}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{reallylightgray}{HTML}{E7E7E7}

\definecolor{mainpurple}{HTML}{8d5daf}
\definecolor{darkpurple}{HTML}{5c3975}
\definecolor{headerpurple}{HTML}{8d5daf}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}

\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{lightgray}
\else
  \colorlet{fillheader}{darkgray}
  \colorlet{header}{lightgray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%
\newfontfamily\bodyfont
[
	Path = Fonts/,
	BoldFont=texgyreheros-bold.otf,
	ItalicFont=texgyreheros-italic.otf,
	BoldItalicFont=texgyreheros-bolditalic.otf
]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[Path = Fonts/]{Lato-Hairline.ttf}
\newfontfamily\headingfont[Path = Fonts/]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[
	Path=Fonts/, 
	Mapping=tex-text, 
	Color=textcolor,
	BoldFont=texgyreheros-bold.otf,
	ItalicFont=texgyreheros-italic.otf,
	BoldItalicFont=texgyreheros-bolditalic.otf
]
{texgyreheros-regular.otf}

\setmathfont[Path=Fonts/]{texgyreheros-regular.otf}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\contactfont}{%
  \fontsize{10pt}{10pt}\selectfont%
  \bodyfont%
  \color{darkgray}%
}

%%%%%%%%%%
% Footer %
%%%%%%%%%%

\newcommand{\footer}[1]{%
	\begin{tikzpicture}[remember picture,overlay]
	\node [rectangle, fill=fillheader, anchor=south, minimum width=\paperwidth, minimum height=1cm] (box) at (current page.south){};
	\node [anchor=center] (name) at (box) {%
		\fontsize{14pt}{24pt}\color{headerpurple}%
		\bodyfont #1%
	};
	\end{tikzpicture}
	\vspace{0.7cm}
	\vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        mainpurple\or%
        mainpurple\or%
        mainpurple\or%
        mainpurple\or%
        mainpurple\else%
        mainpurple\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \Large\headingfont\color{headercolor}%
    \@sectioncolor #1
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}%
	{\Large\headingfont\color{headercolor} #1}
	\par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
	\par\vspace{.5\parskip}%
	{\Large\headingfont\color{headercolor} #2}
	\par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[3]{
	\par\vspace{.5\parskip}%
	{\Large\headingfont\color{headercolor} #3}
	\par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[4]{
	\par\vspace{.5\parskip}%
	{\Large\headingfont\color{headercolor} #4}
	\par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[5]{
	\par\vspace{.5\parskip}%
	{\Large\headingfont\color{headercolor} #5}
	\par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  {\textbf{\tiny\addfontfeature{Color=textcolor} #1}}&\parbox[t]{12.3cm}{%
 	\textbf{#2}%
    \hfill%
	\hfill%
	\hfill%
    {\textbf{\scriptsize\addfontfeature{Color=mainpurple} #3}}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%
% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainpurple,mainpurple,text=white] (char) {#1};}}

\newcommand{\makesidebar}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=reallylightgray, anchor=north, minimum width=9cm, minimum height=\paperheight+2.2cm] (sidebox) at (-5cm,0cm){};
	\end{tikzpicture}
}

\newcommand{\makeprofile}[8]{

  	\makesidebar

	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=lightgray, anchor=north, minimum width=9cm, minimum height=9.5cm] (contactbox) at (-5cm,2cm){};
		\node [anchor=west] (phone) at (-5.95cm,-4.4cm) {%
			\fontsize{12pt}{12pt}\color{textcolor}%
			{\contactfont #4}
		};
		\node [anchor=west] (email) at (-5.95cm,-5.0cm) {%
			\fontsize{12pt}{12pt}\color{textcolor}%
			{\contactfont #5}
		};
		\node [anchor=west] (github) at (-5.95cm,-5.6cm) {%
			\fontsize{12pt}{12pt}\color{textcolor}%
			{\contactfont #6}
		};
		\node [anchor=west] (linkedin) at (-5.95cm,-6.2cm) {%
			\fontsize{12pt}{12pt}\color{textcolor}%
			{\contactfont #7}
		};
		\node [anchor=west] (location) at (-5.95cm,-6.8cm) {%
			\fontsize{12pt}{12pt}\color{textcolor}%
			{\contactfont #8}
		};
	\end{tikzpicture}

	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=headercolor, anchor=north, minimum width=9cm, minimum height=5.2cm] (namebox) at (-5cm,2cm){};
		\node [anchor=west] (name) at (-5.75cm,-1.95cm) {%
			\fontsize{24pt}{50pt}\color{white}%
			{\thinfont #1}{\bodyfont  #2}
		};
		\node [anchor=west] at (-4.82cm,-2.72cm) {%
			\fontsize{12pt}{24pt}\color{headerpurple}%
			\bodyfont ~#3%
		};
	\end{tikzpicture}
}


\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{mainpurple} ##1}
  }
  \begin{textblock}{4.9}(0.4, 6.0)
  \begin{flushleft}
  \obeycr
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
  \let\section\oldsection
}


\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\Large #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{0.8cm}% Whitespace before the section title
	{\large\headingfont\color{mainpurple} #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
	\vspace{0.2cm}
}


%%%%%%%%%%%%%%%%%%%%%%%
% Diagrams and Charts %
%%%%%%%%%%%%%%%%%%%%%%%

% Programming Pie Chart
\RequirePackage{pgf-pie}
\RequirePackage{pstricks}

\newcommand{\programmingPie}{%
	\begin{tikzpicture}[remember picture, xscale=0.55, yscale=0.55, opacity=0.5]
	\pie[% settings
			pos={-568,0},
			%explode=0.22,
			%square,
			polar,
			%cloud,
			color={materialcyan, materialred, materialorange, materialteal, materialamber, materialindigo, materialgreen, materialpurple},
			before number=\phantom, 
			after number=,
			%text=inside,
			text=pin
			%style = drop shadow,
			%scale font
	]
	{10/\scriptsize R, 14/\scriptsize Java, 17/\scriptsize C\#, 20/\scriptsize SAS, 25/\scriptsize JS, 30/\scriptsize Python, 5/\scriptsize Ruby, 7/\scriptsize Scala}% values and labels
	\end{tikzpicture}
	\vspace{0.1cm}
	\vspace{-2\parskip}
}

% Command for printing skill progress bars
\newcommand\interests[1]{ 
	\renewcommand{\interests}{
		\begin{tikzpicture}[remember picture]
		\foreach [count=\i] \x/\y in {#1}{
			\draw[fill=lightgray,lightgray] (0,\i) rectangle (6,\i+0.4);
			\draw[fill=white,mainpurple](0,\i) rectangle (\y,\i+0.4);
			\node [above left] at (0,\i+0.4) {\x};
		}
		\end{tikzpicture}
	}
}

\newcommand\showInterests
{%
	\interests{{Data Mining \& Statistical Analysis/5},{Software Development/5.8},{Cryptography/4.3},{UI Design/4},{Cloud Computing/5}}
	\interests
}

%Bubble Diagram
\RequirePackage{smartdiagram}

\smartdiagramset{
	bubble center node font = \scriptsize,
	bubble node font = \scriptsize,
	% specifies the minimum size of the bubble center node
	bubble center node size = 0.5cm,
	%  specifies the minimum size of the bubbles
	bubble node size = 0.5cm,
	% specifies which is the distance among the bubble center node and the other bubbles
	distance center/other bubbles = 0.3cm,
	% sets the distance from the text to the border of the bubble center node
	distance text center bubble = 0.5cm,
	% set center bubble color
	bubble center node color = mainpurple,
	% define the list of colors usable in the diagram
	set color list = {lightgray, materialcyan, orange, green, materialorange, materialteal, materialamber, materialindigo, materialgreen, materiallime},
	% sets the opacity at which the bubbles are shown
	bubble fill opacity = 0.75,
	% sets the opacity at which the bubble text is shown
	bubble text opacity = 1.0,
}


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=-2.2cm,right=1cm,bottom=0cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}