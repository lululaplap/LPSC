reasonLabels = categorical({'Networking' ,	'Share best practice'	,'Workplace Diversity' ,	'Women in STEM' 	,'LGBTQ+' ,	'Disability' ,	'Mental Health', 	'Ethnic Diversity'});
[sortedData,sortedIndex] = sort(reasonNums,'descend');
sortedLabels = reasonLabels(sortedIndex);
bar(sortedLabels,sortedData)
for i1=1:numel(reasonNums)
    t = text(sortedLabels(i1),sortedData(i1),num2str(sortedData(i1)),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom');
           t.FontSize = 20;
end
%title("Motivations for Attending DISC (n=37)")
ylabel("Number of responses")
fig = gcf;
fig.PaperPositionMode = 'auto';
print('-fillpage','FillPageFigure','-dpdf')
saveas(gcf,'reasons.png')
