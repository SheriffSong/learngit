%%
clear all
close all%关闭图形窗口
load Zn_grid_data.mat
%%
% 100米以上的数据取平均
Zn1_upper_100=nanmean(Zn1(:,:,1:20),3);
%%
% 尝试米勒投影
m_proj('miller','lon',[25 385]);%地图中间的位置经度为西经180度,'lon',[0 360],'lat',[-90 90]
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
%        %xtick对应360度分成多少份，ytick对应180度分成多少份
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
% 用interp2进行插值，改成2度分辨率，限制纬度在50
[lat1,lon1] = meshgrid(lat,lon);
[lat2,lon2]=meshgrid(-49.5:2:49.5,-179.5:2:179.5);
Zn_upper_100_interp2 = interp2(lat1,lon1,Zn1_upper_100,lat2,lon2);
%%
% % 保存及下载数据，不必运行
% save Zn_upper_100_interp2.mat Zn_upper_100_interp2 lat2 lon2
% load Zn_upper_100_interp2.mat
%%
Zn_upper_100_interp2_log=log10(Zn_upper_100_interp2);
%%
% 尝试米勒投影
m_proj('miller','lon',[25 385],'lat',[-50 50]);%地图中间的位置经度为西经180度,'lon',[0 360],'lat',[-90 90]
m_pcolor(lon2+1,lat2,Zn_upper_100_interp2_log);
hold on
m_pcolor(lon2+357,lat2,Zn_upper_100_interp2_log);
shading flat;
% m_coast('patch',[.6 .6 .6])
% m_coast('patch',[.6 .6 .6])
m_coast('patch',[.6 .6 .6],'edgecolor','k','linestyle','-');
% m_grid('xaxis','middle','ytick',5,'grid','none','xaxisloc','bottom','fontsize',10)%,'linestyle','none',...
%        %   'xtick',5,'ytick',5,'fontsize',1','xaxisloc','top','grid','none');
%        %xtick对应360度分成多少份，ytick对应180度分成多少份
m_grid('linewi',2,'ytick',5,'tickdir','none','grid','none');       
v=colorbar('v');
set(get(v,'xlabel'),'fontsize',20);
% set(v,'position',[0.92 0.3 0.030 0.45]);%x,y,width,height
set(gca, 'Color', 'Black')
title('LOG_{10} of upper 100m Dissolved Zn Concentration (nmol L^{-1})','fontsize',10);%'position',[0.25 1.35],
colormap(jet)
% caxis([0 5])
% print(figure(1),'LOG_{10} of upper 100m Dissolved Zn Concentration(2度分辨率)','-dpng','-r600')