%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jordan Moak  Resume/CV Class
% Edited from a template on 10/22/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{moak-resume}[2015/02/28 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{redsRED}{HTML}{BA0C2F}
\definecolor{headerred}{HTML}{e00d38}
\definecolor{redsNode}{HTML}{e8788e}

\definecolor{redsFigureColor1}{HTML}{af2844}
\definecolor{redsFigureColor2}{HTML}{75414b}
\definecolor{redsFigureColor3}{HTML}{c15e72}
\definecolor{redsFigureColor4}{HTML}{e84062}
\definecolor{redsFigureColor5}{HTML}{b77985}
\definecolor{redsFigureColor6}{HTML}{5e0c1b}
\definecolor{redsFigureColor7}{HTML}{a50124}

\definecolor{mainpurple}{HTML}{8d5daf}
\definecolor{headerpurple}{HTML}{8d5daf}
\definecolor{darkgray}{HTML}{5e5e5e}
\definecolor{gray}{HTML}{4D4D4D}

\definecolor{lightgray}{HTML}{999999}
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

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

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
\newfontfamily\FontAwesome[Path = Fonts/]{FontAwesome.ttf}

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
\newfontfamily\FontAwesome[Path = Fonts/]{FontAwesome.ttf}

%%%

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{30pt}{62pt}\color{white}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{headerred}%
      \bodyfont #3%
    };
  \end{tikzpicture}
  \vspace{0.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%
% Footer %
%%%%%%%%%%

\newcommand{\footer}[1]{%
	\begin{tikzpicture}[remember picture,overlay]
	\node [rectangle, fill=fillheader, anchor=south, minimum width=\paperwidth, minimum height=1cm] (box) at (current page.south){};
	\node [anchor=center] (name) at (box) {%
		\fontsize{14pt}{24pt}\color{headerred}%
		\bodyfont #1%
	};
	\end{tikzpicture}
	\vspace{0.5cm}
	\vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        redsRED\or%
        redsRED\or%
        redsRED\or%
        redsRED\or%
        redsRED\else%
        redsRED\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

%\renewcommand{\subsection}[2]{
%  \par\vspace{.5\parskip}%
%  \Large\headingfont\color{headercolor} #2%
%  \par\vspace{.25\parskip}%
%}
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
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=redsRED} #3}\\%
    #4\vspace{\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{redsRED} ##1}
  }
  \begin{textblock}{3.6}(1.25, 2.8)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
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
			color={redsFigureColor1, redsFigureColor2, redsFigureColor3, redsFigureColor4, redsFigureColor5, redsFigureColor6, redsFigureColor7},
			before number=\phantom, 
			after number=,
			%text=inside
			text=pin
			%style = drop shadow,
			%scale font
	]
	{17/Java, 5/C\#, 30/SAS, 17/R, 10/SQL, 14/PowerShell, 7/HTML}% values and labels
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
			\draw[fill=white,redsRED](0,\i) rectangle (\y,\i+0.4);
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
	bubble center node font = \footnotesize,
	bubble node font = \footnotesize,
	% specifies the minimum size of the bubble center node
	bubble center node size = 0.5cm,
	%  specifies the minimum size of the bubbles
	bubble node size = 0.5cm,
	% specifies which is the distance among the bubble center node and the other bubbles
	distance center/other bubbles = 0.3cm,
	% sets the distance from the text to the border of the bubble center node
	distance text center bubble = 0.5cm,
	% set center bubble color
	bubble center node color = redsNode,
	% define the list of colors usable in the diagram
	set color list = {redsFigureColor1,redsFigureColor2, redsFigureColor3, redsFigureColor6, redsFigureColor7},
	% sets the opacity at which the bubbles are shown
	bubble fill opacity = 0.6,
	% sets the opacity at which the bubble text is shown
	bubble text opacity = 0.8,
}


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}