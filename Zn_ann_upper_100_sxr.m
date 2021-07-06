%%
clear all
close all%�ر�ͼ�δ���
load Zn_grid_data.mat
%%
% 100�����ϵ�����ȡƽ��
Zn1_upper_100=nanmean(Zn1(:,:,1:20),3);
%%
% ��������ͶӰ
m_proj('miller','lon',[25 385]);%��ͼ�м��λ�þ���Ϊ����180��,'lon',[0 360],'lat',[-90 90]
[lat1,lon1] = meshgrid(lat,lon);
m_pcolor(lon1+1.5,lat1, Zn1_upper_100);
hold on
m_pcolor(lon1+358.5,lat1,Zn1_upper_100);
shading flat;
% m_coast('patch',[.6 .6 .6])
% m_coast('patch',[.6 .6 .6])
m_coast('patch',[.6 .6 .6],'edgecolor','k','linestyle','-');
% m_grid('xaxis','middle','ytick',5,'grid','none','xaxisloc','bottom','fontsize',10)%,'linestyle','none',...
%        %   'xtick',5,'ytick',5,'fontsize',1','xaxisloc','top','grid','none');
%        %xtick��Ӧ360�ȷֳɶ��ٷݣ�ytick��Ӧ180�ȷֳɶ��ٷ�
m_grid('linewi',2,'ytick',5,'tickdir','none','grid','none');       
v=colorbar('v');
% set(get(v,'xlabel'),'fontsize',20);
% set(v,'position',[0.92 0.28 0.030 0.50]);%x,y,width,height
% set(gca, 'Color', 'Black')
title('Dissolved Zn distribution in the upper 100m ocean (nmol L^{-1})','fontsize',20);%'position',[0.25 1.35],
colormap(jet)
caxis([0 5])
% saveas(gcf,'Dissolved Zn distribution in the upper 100m ocean.png')
% print(figure(1),'Dissolved Zn distribution in the upper 100m ocean(miller grided)','-dpng','-r600')
%%
% ��interp2���в�ֵ���ĳ�2�ȷֱ��ʣ�����γ����50
[lat1,lon1] = meshgrid(lat,lon);
[lat2,lon2]=meshgrid(-49.5:2:49.5,-179.5:2:179.5);
Zn_upper_100_interp2 = interp2(lat1,lon1,Zn1_upper_100,lat2,lon2);
%%
% % ���漰�������ݣ���������
% save Zn_upper_100_interp2.mat Zn_upper_100_interp2 lat2 lon2
% load Zn_upper_100_interp2.mat
%%
Zn_upper_100_interp2_log=log10(Zn_upper_100_interp2);
%%
% ��������ͶӰ
m_proj('miller','lon',[25 385],'lat',[-50 50]);%��ͼ�м��λ�þ���Ϊ����180��,'lon',[0 360],'lat',[-90 90]
m_pcolor(lon2+1,lat2,Zn_upper_100_interp2_log);
hold on
m_pcolor(lon2+357,lat2,Zn_upper_100_interp2_log);
shading flat;
% m_coast('patch',[.6 .6 .6])
% m_coast('patch',[.6 .6 .6])
m_coast('patch',[.6 .6 .6],'edgecolor','k','linestyle','-');
% m_grid('xaxis','middle','ytick',5,'grid','none','xaxisloc','bottom','fontsize',10)%,'linestyle','none',...
%        %   'xtick',5,'ytick',5,'fontsize',1','xaxisloc','top','grid','none');
%        %xtick��Ӧ360�ȷֳɶ��ٷݣ�ytick��Ӧ180�ȷֳɶ��ٷ�
m_grid('linewi',2,'ytick',5,'tickdir','none','grid','none');       
v=colorbar('v');
set(get(v,'xlabel'),'fontsize',20);
% set(v,'position',[0.92 0.3 0.030 0.45]);%x,y,width,height
set(gca, 'Color', 'Black')
title('LOG_{10} of upper 100m Dissolved Zn Concentration (nmol L^{-1})','fontsize',10);%'position',[0.25 1.35],
colormap(jet)
% caxis([0 5])
% print(figure(1),'LOG_{10} of upper 100m Dissolved Zn Concentration(2�ȷֱ���)','-dpng','-r600')