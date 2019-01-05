labs = categorical(employmentLabs)
bar(labs,employmentStatusNums*100/36)
ylabel("% Attendees")
for i1=1:numel(employmentStatusNums)
    t = text(labs(i1),employmentStatusNums(i1)*100/36,num2str(employmentStatusNums(i1)*100/36,'%0.1f'),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom');
           t.FontSize = 20;
end
saveas(gcf,'employment.png')
