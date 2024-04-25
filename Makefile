all: main.pdf

main.pdf: main.tex references.bib Fig*.pdf Table*.tex
	latexmk -pdf main.tex

Fig*.pdf:
	datalad get adaptation_specialization_material/output/acl_2002_2022/*.pdf
	datalad get adaptation_specialization_material/output/etm_20_pretrained/*.pdf
	datalad get adaptation_specialization_material/output/etm_20_pretrained/*.png
	cp -L adaptation_specialization_material/output/etm_20_pretrained/sankey_control_control_nu_compact.pdf ./Fig3a.pdf
	cp -L adaptation_specialization_material/output/etm_20_pretrained/sankey_control_control_nu_compact_darkmatter.pdf ./Fig3b.pdf
	cp -L adaptation_specialization_material/output/etm_20_pretrained/trajectory_example_S.Ando.1.eps ./Fig4a.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/trajectory_example_J.F.Beacom.1.eps ./Fig4b.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/change_score_effects_entropy_magnitude.eps ./Fig5.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/entered_score_effects_entropy_magnitude.eps ./Fig6.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/ei_gamma_control_nu.eps ./Fig7a.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/ei_delta_control_nu.eps ./Fig7b.eps
	cp -L adaptation_specialization_material/output/experiments.eps ./Fig8.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/sample_characteristics.png ./Fig9.png
	cp -L adaptation_specialization_material/output/etm_20_pretrained/topic_citation_matrix.eps ./Fig10.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/pacs_clustermap.eps ./Fig11.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/capital_measures.eps ./Fig12.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/cost_matrix_knowledge_bounded.eps ./Fig13.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/cost_vs_nu_knowledge.eps ./Fig14a.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/ei_R_control_nu.eps ./Fig14b.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/change_score.eps ./Fig15.eps
	cp -L adaptation_specialization_material/output/etm_20_pretrained/disruption_score_effects_entropy_magnitude.eps ./Fig16.eps
	cp -L adaptation_specialization_material/output/acl_2002_2022/sankey_control_nu_acl.pdf ./Fig17.pdf
	
Table*.tex:
	cp -L adaptation_specialization_material/output/etm_20_pretrained/topics.tex ./Table1.tex
	cp -L adaptation_specialization_material/output/scores.tex ./Table2.tex
	cp -L adaptation_specialization_material/output/etm_20_pretrained/summary_change_disruption.tex ./Table3.tex
	cp -L adaptation_specialization_material/output/etm_20_pretrained/summary_entered_exited.tex ./Table4.tex
	cp -L adaptation_specialization_material/output/etm_20_pretrained/low_change.tex ./Table5.tex
	cp -L adaptation_specialization_material/output/etm_20_pretrained/top_change.tex ./Table6.tex
	cp -L adaptation_specialization_material/output/hep_vs_acl.tex ./Table7.tex

clean:
	rm -rf rm -f *.bbl *.aux *.blg *.log *.out *.pdf *.tdo *.fls *.fdb_latexmk *.ist *-eps-converted-to.pdf *.bcf *.run.xml *.acn *.synctex.gz *.toc
	rm -rf ./Fig*.eps
	rm -rf ./Fig*.pdf
	rm -rf ./Fig*.png
	rm -rf ./Table*.tex
	datalad drop adaptation_specialization_material/output/etm_20_pretrained/*.pdf
	datalad drop adaptation_specialization_material/output/etm_20_pretrained/*.png
