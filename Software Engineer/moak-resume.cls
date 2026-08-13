%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jordan Moak  Resume/CV Class
% Edited from a template on 10/22/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{moak-resume}[2026/07/06 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{fontawesome5}
\RequirePackage[math-style=TeX]{unicode-math}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ifthen}
\RequirePackage{parskip}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{needspace}
\RequirePackage{enumitem}
% Font is set at list level so wrapped lines and inter-item gaps share one baseline grid.
% A measured 3pt rhythm keeps the first page open without looking artificially padded.
\setlist[itemize]{itemsep=3pt, parsep=0pt, topsep=3pt, partopsep=0pt, leftmargin=1.2em, before=\small\bodyfont}


%%%%%%%%%%
% Colors %
%%%%%%%%%%
\definecolor{white}{RGB}{255,255,255}
\definecolor{darkgray}{HTML}{5e5e5e}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{reallylightgray}{HTML}{E7E7E7}
\definecolor{contactcolor}{HTML}{303030}

\definecolor{mainpurple}{HTML}{8d5daf}
\colorlet{headerpurple}{mainpurple}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

% Accent palette used by the pie chart and bubble diagram
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialorange}{HTML}{FF5722}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
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
  \fontsize{10pt}{12pt}\selectfont%
  \headingfont%
  \color{headerpurple}%
}

% Keep the profile title on one line, scaling down only when its measured
% width exceeds the available sidebar column.
\newsavebox{\roletitlebox}
\newcommand{\fitroletitle}[1]{%
  \sbox{\roletitlebox}{\rolefont #1}%
  \ifdim\wd\roletitlebox>4.85cm
    \resizebox{4.85cm}{!}{\usebox{\roletitlebox}}%
  \else
    \usebox{\roletitlebox}%
  \fi
}

\newcommand{\contactfont}{%
  \fontsize{10pt}{10pt}\selectfont%
  \bodyfont%
  \color{contactcolor}%
}

\newcommand{\contactprimary}[1]{{\headingfont\color{contactcolor}#1}}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

% Colored section prefix: \section{Exp|erience} colors "Exp"; move the
% pipe to taste. A title without a pipe is colored entirely.
\def\@colorsplit#1|#2|#3\@nil{{\color{mainpurple}#1}#2}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \Large\headingfont\color{headercolor}%
    \@colorsplit#1||\@nil
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}%
	{\Large\headingfont\color{headercolor} #1}
	\par\vspace{.25\parskip}%
}

% Establish the first-page content pane below the profile treatment without
% affecting the absolutely positioned sidebar.
\newcommand{\maincontentstart}{\par\vspace*{0.5in}}

% Separate adjacent roles by roughly one visual line once the list's natural
% trailing space is included. Kept explicit so project entries are unaffected.
\newcommand{\experiencegap}{\par\vspace{0.65\baselineskip}}

% Give employment accomplishments a modest readability lift without changing
% the denser project and education typography on the continuation page.
\newenvironment{experienceitems}{%
  \begin{itemize}[before={\fontsize{9.5pt}{11.5pt}\selectfont\bodyfont}]%
}{%
  \end{itemize}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \needspace{4\baselineskip}% keep an entry heading with its first bullets
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\resumeentryrow}[6]{%
  {\textbf{\tiny\addfontfeature{Color=textcolor} #1}}&\parbox[t]{\dimexpr\textwidth-2.4cm\relax}{%
    {#5\textbf{#2}}%
    \hfill%
    {#6\textbf{\addfontfeature{Color=mainpurple} #3}}%
    \ifthenelse{\equal{#4}{}}{}{\\{\footnotesize\itshape\addfontfeature{Color=darkgray} #4}}%
  }\\}
\newcommand{\entry}[4]{%
  \resumeentryrow{#1}{#2}{#3}{#4}{\normalsize}{\scriptsize}}

% Experience headings carry enough visual weight to anchor the more open role
% spacing while retaining the title-to-company proportions of the base design.
\newcommand{\experienceentry}[4]{%
  \resumeentryrow{#1}{#2}{#3}{#4}{\fontsize{11pt}{13pt}\selectfont}{\fontsize{8pt}{9.5pt}\selectfont}}


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

\newcommand{\makeprofile}[9]{

  	\makesidebar

	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=lightgray, anchor=north, minimum width=9cm, minimum height=9.5cm] (contactbox) at (-5cm,2cm){};
		\node [anchor=west] (website) at (-5.95cm,-4.4cm) {%
			\fontsize{12pt}{12pt}\color{textcolor}%
			{\contactfont #6}
		};
		\node [anchor=west] (email) at (-5.95cm,-4.95cm) {%
			\fontsize{12pt}{12pt}\color{textcolor}%
			{\contactfont #5}
		};
		\node [anchor=west] (phone) at (-5.95cm,-5.5cm) {%
			\fontsize{12pt}{12pt}\color{textcolor}%
			{\contactfont #4}
		};
		\node [anchor=west] (github) at (-5.95cm,-6.05cm) {%
			\fontsize{12pt}{12pt}\color{textcolor}%
			{\contactfont #7}
		};
		\node [anchor=west] (linkedin) at (-5.95cm,-6.6cm) {%
			\fontsize{12pt}{12pt}\color{textcolor}%
			{\contactfont #8}
		};
		\node [anchor=west] (location) at (-5.95cm,-7.15cm) {%
			\fontsize{12pt}{12pt}\color{textcolor}%
			{\contactfont #9}
		};
	\end{tikzpicture}

	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=headercolor, anchor=north, minimum width=9cm, minimum height=5.2cm] (namebox) at (-5cm,2cm){};
		\node [anchor=west] (name) at (-5.75cm,-1.95cm) {%
			\fontsize{24pt}{50pt}\color{white}%
			{\thinfont #1}{\bodyfont  #2}
		};
		\node [anchor=east] at (-0.7cm,-2.72cm) {%
			\fitroletitle{#3}%
		};
	\end{tikzpicture}
}

% Start a clean continuation page without repeating the first-page sidebar.
% The wider text area gives project and education entries room to breathe,
% while the compact identity header keeps the second page self-contained.
\newcommand{\makecontinuationpage}[3]{%
	\clearpage
	\newgeometry{left=1.4cm,top=1.1cm,right=1.4cm,bottom=1.2cm,nohead,nofoot}%
	\noindent
	\begin{minipage}[b]{0.62\textwidth}
		{\fontsize{20pt}{22pt}\selectfont\thinfont #1 }%
		{\fontsize{20pt}{22pt}\selectfont\bodyfont #2}%
	\end{minipage}%
	\begin{minipage}[b]{0.38\textwidth}
		\raggedleft
		{\small\headingfont\color{mainpurple} #3}%
	\end{minipage}
	\par\vspace{0.25cm}
	{\color{reallylightgray}\hrule height 1pt}
	\vspace{0.35cm}
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
  \setlength{\lineskip}{3pt}% breathing room between wrapped rows of skill chips
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

% Focus chart
\RequirePackage{pgf-pie}

\newcommand{\focusChart}{%
	\hspace*{-0.36cm}% center the chart beneath the sidebar section heading
	\begin{tikzpicture}[remember picture, xscale=0.5, yscale=0.5, opacity=0.5]
	\pie[% settings
			pos={-568,0},
			%explode=0.22,
			%square,
			polar,
			%cloud,
			color={materialcyan, materialteal, materialorange, materialindigo, materialamber, materialgreen},
			before number=\phantom, 
			after number=,
			%text=inside,
			text=pin
			%style = drop shadow,
			%scale font
	]
	% Preserve the established slice geometry while keeping the shortest label
	% in the alignment-sensitive left position. Numbers are intentionally hidden.
	{15/\scriptsize Architecture, 30/\scriptsize Agentic Systems, 20/\scriptsize Quality, 25/\scriptsize Platform Tooling, 10/\scriptsize Automation}
	\end{tikzpicture}
	\vspace{0.1cm}
	\vspace{-2\parskip}
}

% Connected capability index: numbered nodes create a subtle systems-diagram
% motif while the typography stays compact and easy to scan.
\newcommand{\skillsep}{{\color{mainpurple!75}\kern0.3em\raisebox{0.18ex}{\tiny\textbullet}\kern0.3em}}
\tikzset{skillindex/.style={
	circle,
	fill=mainpurple,
	draw=none,
	minimum size=0.48cm,
	inner sep=0pt,
	text=white,
}}
\tikzset{skillcopy/.style={
	anchor=north west,
	inner sep=0pt,
	outer sep=0pt,
	text width=4.05cm,
}}
\newcommand{\skillcategory}[3]{%
	\par\noindent
	\begin{tikzpicture}[baseline=(index.base)]
		\node[skillindex] (index) at (0.24cm,0) {\tiny\headingfont #1};
		\node[skillcopy] (copy) at (0.65cm,0.16cm) {%
			{\scriptsize\headingfont\color{mainpurple}\MakeUppercase{#2}}\\[-1pt]
			{\scriptsize\bodyfont\color{darkgray}#3}%
		};
		\draw[mainpurple!35,line width=0.6pt]
			(index.south) -- (index.south |- copy.south);
	\end{tikzpicture}%
	\vspace{0.16cm}% the aside's active line break closes the row
}


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=-2.2cm,right=1cm,bottom=0cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
