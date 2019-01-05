labs = categorical(communityLabs)
labs = reordercats(labs,{'A Level Physics','UG Physics & Astronomy','Astronomy Researchers','UG Engineering','Engineering Workforce','UG Non-STEM'})
bar(labs,communityNums)
ylabel('% Female')

for i1=1:numel(communityNums)
    t = text(labs(i1),communityNums(i1),num2str(communityNums(i1),'%0.1f'),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom');
           t.FontSize = 20;
end