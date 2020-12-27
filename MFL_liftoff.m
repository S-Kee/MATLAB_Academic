clc;clear;
% syms x  h b y;
% pretty(Hx(x,y,b,h));
% Hx(x,y,b,h)
% ȱ�ݰ��0.1����1������1���ף�
x=0;   %�ռ�λ��
y=1; %����ֵ
b=0.1; %ȱ�ݰ��
h=1;   %ȱ�����
% d=  ;  %������

% ���������ǩ
x_label="Thickness (mm)";
y_label="$H_x$ (A/m)";

d=linspace(0,y);
y1=Hx(x,y-d,b,h+d)-Hx(x,y-d,b,d);
y2=Hx(x,y,b,h)+0*d;

% ��ͼ

global lgdt;
lgdt = ["Iron with slot","Air"]; %\fontname{����}

% ͼ������
plot_fig(x_label, y_label, d, y1, d, y2)

function plot_fig(x_label, y_label, x1, y1, x2, y2)
global lgdt;

% ����ͼ��
fig = figure;
ax = axes(fig);

h1=plot(x1,y1);hold on;
h2=plot(x2,y2);

% ����������Ⱦ���棬ȫӢ��ʹ��latex��������ʹ��tex
la_tex='latex';

% ��������
fig_font="cmr10"; % Times new roman

fig.Units = 'centimeters';
fig.Position(3:4) = [6, 5]; % 7cmx5.25cm ��3����4������
fig.PaperUnits = 'centimeters';

fig.PaperPosition(3:4) = [6, 5]; % 7cmx5.25cm
fig.Color = [1.0, 1.0, 1.0]; % background color

ax.Units = 'centimeters';
% ax.Position = [1.4, 1, 4, 4];
ax.LineWidth = 0.75;
ax.FontName =fig_font; 
ax.FontSize = 9;
ax.TickLabelInterpreter = la_tex;
ax.LooseInset=[0.3,0.3,0.3,0.3];  % ���ưױߣ�0Ϊ�ްױ�
box(ax,'off');  % �ر����������

ax.XLabel.String = x_label;
ax.XLabel.Units = 'normalized';
%ax.XLabel.Position = [0.5, -0.125];
ax.XLabel.Interpreter = la_tex;
% ax.XLim(1) = 0;

% tick
ax.XTick=(0:0.25:1);
ax.XMinorTick = 'on';   % �����꿪��
ax.TickDir = 'out';       % �����ǩ����
ax.TickLength(1) = 0.02; % �����ǩ����


set(h1, 'color', 'k','LineStyle','-','linewidth',1.5);
set(h2,'LineStyle','--','linewidth',1.5);

ax.YLabel.String=y_label;
ax.YLabel.Units = 'normalized';
% ax.YLabel.Position = [-0.1, 0.5];
ax.YLabel.Interpreter = la_tex;
% ax.YLim(1) = 0;
% axis([0 100 0 1.5]);
ax.YTick=(0:0.1:0.5);
ax.YMinorTick = 'on';
ax.TickLength = [0.02 0.035];

% lgd('on')
legend(lgdt);
lgd=legend(ax);
lgd.Interpreter = la_tex;
lgd.Location = 'best';
lgd.Box = 'off';
lgd.NumColumns = 1;

saveas(fig, 'MFL_liftoff', 'emf')
% print(fig, 'MFL_liftoff','-r300','-dsvg');

end
