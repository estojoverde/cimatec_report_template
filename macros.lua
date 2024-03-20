\directlua{
    function mycustomsection(name)
        tex.sprint([[
            \documentclass[../../../../main.tex]{subfiles}
            \graphicspath{ {\subfix{../../../../CTsettings/figures/}} {./figures/} {../figures/} {../../figures/}}
            %%%%%%% DO NOT TOUCH IT! Or it might crash... dont come asking for support later ¯\_(ツ)_/¯. 
            
            
            %%%%%%% DO NOT TOUCH IT! Or it might crash... dont come asking for support later ¯\_(ツ)_/¯. 
            \begin{document}
            \onlyinsubfile{
                \renewcommand{\onlyinsubfile}[1]{}
                \renewcommand{\notinsubfile}[1]{#1}
            
                \renewcommand{\onlyonmainfile}[1]{}
                \renewcommand{\onlyonpartfile}[1]{}
                \renewcommand{\onlyonchapterfile}[1]{}
                \renewcommand{\onlyonsectionfile}[1]{#1}
            
                \gdef\CTMcalibrefontpath{../../../../CTsettings/calibrefontfiles/}
                \setcalibrefont{\CTMcalibrefontpath}
                
                \fancypagestyle{plain}{\pagestyle{CTstylewithpage}}
                \pagestyle{CTstylewithpage}
            }
            \section{\directlua{tex.sprint(name)}}
        ]])
    end
}