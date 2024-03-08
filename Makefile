all: main.pdf

main.pdf: main.tex references.bib Fig*.pdf Table*.tex
	latexmk -pdf main.tex

Fig*.pdf:
	datalad get adaptation_specialization_material/output/etm_20_pretrained/*.pdf
	datalad get adaptation_specialization_material/output/etm_20_pretrained/*.png
	cp -L adaptation_specialization_material/output/etm_20_pretrained/sankey_control_control_nu_compact.pdf plots/Fig3.pdf
	cp -L adaptation_specialization_material/output/etm_20_pretrained/trajectory_example_S.Ando.1.eps plots/Fig4a.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/trajectory_example_J.F.Beacom.1.eps plots/Fig4b.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/change_score_effects_entropy_magnitude.eps plots/Fig5.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/exited_score_effects_entropy_magnitude.eps plots/Fig6.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/ei_gamma_control_nu.eps plots/Fig7a.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/ei_delta_control_nu.eps plots/Fig7b.eps
	cp -L adaptation_specialization_material/output/experiments.eps plots/Fig8.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/sample_characteristics.png plots/Fig9.png
	cp -L adaptation_specialization_material/output/etm_20_pretrained/topic_citation_matrix.eps plots/Fig10.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/pacs_clustermap.eps plots/Fig11.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/capital_measures.eps plots/Fig12.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/cost_matrix_knowledge_bounded.eps plots/Fig13.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/cost_vs_nu_knowledge.eps plots/Fig14a.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/ei_R_control_nu.eps plots/Fig14b.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/change_score.eps plots/Fig15.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/disruption_score_effects_entropy_magnitude.eps plots/Fig16.eps
	
Table*.tex:
	cp -L adaptation_specialization_material/output/etm_20_pretrained/topics.tex tables/Table1.tex
	cp -L adaptation_specialization_material/output/scores.tex tables/Table2.tex
	cp -L adaptation_specialization_material/output/etm_20_pretrained/summary_change_disruption.tex tables/Table3.tex
	cp -L adaptation_specialization_material/output/etm_20_pretrained/summary_entered_exited.tex tables/Table4.tex
	cp -L adaptation_specialization_material/output/etm_20_pretrained/low_change.tex tables/Table5.tex
	cp -L adaptation_specialization_material/output/etm_20_pretrained/top_change.tex tables/Table6.tex
	cp -L adaptation_specialization_material/output/hep_vs_acl.tex tables/Table7.tex

clean:
	rm -rf rm -f *.bbl *.aux *.blg *.log *.out *.pdf *.tdo *.fls *.fdb_latexmk *.ist *-eps-converted-to.pdf *.bcf *.run.xml *.acn *.synctex.gz *.toc
	rm -rf plots/Fig*.eps
	rm -rf plots/Fig*.pdf
	rm -rf plots/Fig*.png
	rm -rf tables/Table*.tex
	datalad drop adaptation_specialization_material/output/etm_20_pretrained/*.pdf
	datalad drop adaptation_specialization_material/output/etm_20_pretrained/*.png
