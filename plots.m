n=7
genderCounts = zeros(n,3);
for i=1:n
yearCond = (year(memberData.registration_date)==2011+i);
noMale = size(memberData.gender(memberData.gender=='male' & yearCond))
noFemale = size(memberData.gender(memberData.gender=='female' & yearCond))
noOther = size(memberData.gender(memberData.gender=='other' & yearCond))
total = noMale+noFemale+noOther
genderCounts(i,:) = [noMale(1),noFemale(1),noOther(1)];
genderCounts(i,:) = genderCounts(i,:)/total(1);
end
pre16 = nanmean(genderCounts(1:5,:))
post16 = nanmean(genderCounts(4:7,:))
genderCounts1 = zeros(3,3)
genderCounts1(1,:) = pre16
genderCounts1(2:3,:) = genderCounts(6:7,:)

c = categorical({'Pre 2016','2017','2018'});
c = reordercats(c,{'Pre 2016','2017','2018'})
bar(c,genderCounts1(:,1:2),'stacked')
title('New Members by Year')

noFemales=zeros(3,5)
noFemales(1,:) = mean(HESS.noFemales(6:9,:))%engineering and physical sciences
noFemales(2,:) = mean(HESS.noFemales(1:5,:))%bio and medical sciences
noFemales(3,:) = HESS.noFemales(20,:)%non science
figure
bar(noFemales.')
DISC=zeros(3)
Careers18=zeros(3)
LRC=zeros(3)
NSSC18 = zeros(3)
DISC(1) = 9;
DISC(2)= 25;
DISC(3) = 1;
Careers18(1) = 34;
Careers18(2) = 11;
Careers18(3) = 0;
LRC(1) = 37;
LRC(2) = 9;
LRC(3) = 2;
NSSC18(1) = 215;
NSSC18(2) = 116;
NSSC18(3) = 0;
figure
c= categorical({'DISC','Careers Launch','LRC','NSSC','UKSEDS Members'})
percents = [DISC(2)/sum(DISC(:)),Careers18(2)/sum(Careers18(:)),LRC(2)/sum(LRC(:)),NSSC18(2)/sum(NSSC18(:)),post16(2)];
bar(c,percents.*100)
for i1=1:numel(percents.*100)
    t = text(c(i1),percents(i1)*100,num2str(percents(i1)*100,'%0.1f'),...
               'HorizontalAlignment','center',...
               'VerticalAlignment','bottom');
           t.FontSize = 20;
end
%title("% of Female Attendees")
saveas(gcf,'UKSEDSactivities.png')

ylabel("% Female")
