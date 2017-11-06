tabPanel("Theory", value = "Theory",
         withMathJax(),
         h4("Temporal Order Jugments (TOJ)"),
         p("Multisensory integration is often measured in audiovisual tasks where participants are told to
           press a button as soon as they perceive a given stimulus. Then, reaction times are evaluated. 
            The TWIN Model is one approach on how to measure the probability of multisensory integration given certain circumstances.
            In tasks concerning temporal order judgments, the 
           participant is asked to report which stimulus they perceived first. Here, the visual and auditory stimulus are presented with predefined
           Stimulus onset asynchrony (SOA, \\(\\tau\\) )."),
         h4("Relation between RT and TOJ"),
         p("For positive and negative values of \\(\\tau\\), each of the following integrals need to be evaluated:
$$\\begin{equation}
           \\begin{aligned}
           p1 &= Pr(A + \\tau < V < A + \\tau + \\omega) = \\int_{0}^{\\infty}\\{F_{V}(a+\\tau+\\omega) - F_{V}(a+\\tau)\\} \\mathrm{d}F_{A}(a), \\\\
           p2 &= Pr(V < A + \\tau < V + \\omega) = \\int_{0}^{\\infty}\\{F_{A}(v+\\omega-\\tau) - F_{A}(v-\\tau)\\} \\mathrm{d}F_{V}(v), \\\\
           p3 &= Pr(V < A + \\tau - \\omega) = \\int_{0}^{\\infty}F_{V}(a+\\tau-\\omega)\\mathrm{d}F_{A}(a).
           \\end{aligned}
           \\end{equation}$$"),
        p("For \\(\\tau < 0\\)
           $$\\begin{equation}
             p1 =
               \\begin{cases}
             \\frac{\\lambda_V}{\\lambda_{V}+\\lambda_{A}}\\{\\text{exp}[\\lambda_{A}(\\tau+\\omega)]-\\text{exp}[\\lambda_{A}\\tau]\\} & \\text{if } \\tau + \\omega < 0;\\\\
             \\frac{}{}  & \\text{if } \\tau < 0 < \\tau + \\omega;
             \\end{cases}
            \\end{equation}$$
and
        $$\\begin{equation}
          p2 = \\frac{\\lambda_V}{\\lambda_{V}+\\lambda_A}\\{\\text{exp}[\\lambda_{A}\\tau]-\\text{exp}[-\\lambda_{A}(\\tau-\\omega)]\\};
          \\end{equation}$$
and
        $$\\begin{equation}
          p3 = \\frac{\\lambda_V}{\\lambda_{V}+\\lambda_A}\\text{exp}[-\\lambda_{A}](\\tau-\\omega)].
          \\end{equation}$$
"), 
p("For \\(\\tau > 0\\)
          $$\\begin{equation}
          p1 = \\frac{\\lambda_A}{\\lambda_{V}+\\lambda_A}\\{\\text{exp}[-\\lambda_{V}\\tau]-\\text{exp}[-\\lambda_{V}(\\tau+\\omega)]\\},
          \\end{equation}$$
and
          $$\\begin{equation}
          p2 = 
          \\begin{cases}
          \\frac{\\lambda_A}{\\lambda_{V}+\\lambda_A}\\{\\text{exp}[-\\lambda_{V}(\\tau-\\omega)]-\\text{exp}[-\\lambda_{V}\\tau]\\}  & \\text{if } \\tau > \\omega,\\\\
          \\frac{\\lambda_A}{\\lambda_{V}+\\lambda_A}\\{1-\\text{exp}[-\\lambda_{V}\\tau]\\}+\\frac{\\lambda_V}{\\lambda_{V}+\\lambda_A}\\{1-\\text{exp}[-\\lambda_{A}(\\omega-\\tau)]\\}  & \\text{if } \\tau < \\omega,
          \\end{cases}
          \\end{equation}$$
and
          $$\\begin{equation}
          p3 =
          \\begin{cases}
          \\frac{\\lambda_V}{\\lambda_{V}+\\lambda_A}\\text{exp}[-\\lambda_{A}(\\omega-\\tau)] & \\text{if } \\tau < \\omega,\\\\
          1-\\frac{\\lambda_A}{\\lambda_{V}+\\lambda_A}\\text{exp}[-\\lambda_{V}(\\tau-\\omega)] & \\text{if } \\tau > \\omega.
          \\end{cases}
          \\end{equation}$$
         
"),
         h4("TOJ Probabilities"),
         p("To compute the TOJ probabilities under the TWIN model, the cases of \\(\\tau\\) < 0 and \\(\\tau\\) > 0 must be considered seperately. 
           This is denoted here as $$\\Psi^{-}\\tau \\text{ and } \\Psi^{+}\\tau$$."),
         p("$$\\begin{equation}
            \\Psi^{-}(\\tau) =
           \\begin{cases}\\!
           \\frac{\\lambda_A}{\\lambda_{V}+\\lambda_A}\\{\\text{exp}[\\lambda_{A}(\\tau+\\omega)][1+\\beta(-1+\\text{exp}[2\\lambda_{A}\\omega]))\\} & \\text{if } \\tau + \\omega < 0;\\\\
           \\begin{aligned}[b]
           \\frac{1}{\\lambda_{V}+\\lambda_A}\\{\\text{exp}[\\lambda_{A}(\\tau+\\omega)]\\lambda_{V}+\\beta(\\lambda_{A}(1-\\text{exp}[-\\lambda_{V}(\\omega+\\tau)])\\\\ +\\lambda_{V}(1-\\text{exp}[\\lambda_{A}(-\\omega+\\tau)]))\\} 
           \\end{aligned}
           & \\text{if } 0 < \\tau + \\omega
           \\end{cases}
           \\end{equation}$$
           $$\\begin{equation}
           \\Psi^{+}(\\tau) =
           \\begin{cases}\\!
           1-\\frac{\\lambda_A}{\\lambda_{V}+\\lambda_A}\\{\\text{exp}[-\\lambda_{V}(\\omega+\\tau)][\\beta-(\\beta-1)\\text{exp}[2\\lambda_{V}\\omega]]\\} & \\text{if } \\tau > \\omega;\\\\
           \\begin{aligned}[b]
           \\frac{1}{\\lambda_{V}+\\lambda_A}\\{\\text{exp}[\\lambda_{A}(-\\omega+\\tau)]\\lambda_{V}+\\beta[\\lambda_{A}(1-\\text{exp}[-\\lambda_{V}(\\omega+\\tau)])\\\\ +\\lambda_{V}(1-\\text{exp}[\\lambda_{A}(-\\omega+\\tau)])]\\} 
           \\end{aligned}
           & \\text{if } \\tau < \\omega
           \\end{cases}
           \\end{equation}$$"),
 
         
         h4("References"),  # die habe ich einfach mal auch hier in die App mit aufgenommen, weil wir die Formeln hier ja auch benutzen
          withTags({
           ul(
             li(HTML("Colonius, H., & Diederich, A. (2004). Multisensory interaction
                     in saccadic reaction time: a time-window-of-integration model.
                     <em>Journal of cognitive neuroscience, 16</em>(6), 1000-1009."),
                a("doi:10.1162/0898929041502733", target="_blank",
                  href="http://www.mitpressjournals.org/doi/abs/10.1162/0898929041502733"),
                a("[pdf]", target="_blank",
                  href="http://www.mitpressjournals.org/doi/pdf/10.1162/0898929041502733")
             ),
             li(HTML("Diederich, A., & Colonius, H. (2015). The time window of
                     multisensory integration: Relating reaction times and judgments
                     of temporal order. <em>Psychological review, 122</em>(2), 232."),
                a("doi:10.1037/a0038696", target="_blank",
                  href="http://dx.doi.org/10.1037/a0038696"),
                a("[pdf]", target="_blank",
                  href="https://www.uni-oldenburg.de/fileadmin/user_upload/psycho/ag/kogn/colonius/Diederich_colonius2015PsychReview_TWINrelatingRTtoTOJ.pdf")
             ),
             li(HTML("Kandil, F. I., Diederich, A., & Colonius, H. (2014). Parameter
                     recovery for the time-window-of-integration (twin) model of
                     multisensory integration in focused attention. <em>Journal of
                     vision, 14</em>(11), 14-14."),
                a("doi:10.1167/14.11.14", target="_blank",
                  href="http://jov.arvojournals.org/article.aspx?articleid=2193864"),
                a("[pdf]", target="_blank",
                  href="http://jov.arvojournals.org/data/journals/jov/933543/i1534-7362-14-11-14.pdf") 
             )
           )
         })
         
)