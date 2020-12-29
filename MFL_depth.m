clc;clear;
% syms x  h b y;
% pretty(Hx(x,y,b,h));
% Hx(x,y,b,h)
% ȱ�ݰ��0.1����1������1���ף�
x=0;   %�ռ�λ��
y=1; %����ֵ
b=0.1; %ȱ�ݰ��
% h=1;   %ȱ�����


% ���� figure
fig = figure;
% ���� axes
ax = axes(fig);


% ���������ǩ
x_label="\fontname{����}��� \fontname{latin modern math}(A/mm)";% latex��ʽ��Ӣ�Ĳ���times����latin
y_label1="$H_x$ (A/m)";
y_label2="$H^{'}_{x}$ (A/m$\cdot$mm)";

llw = 1.5; % ���������߿�

% ��������
h=linspace(0,100);
y1=Hx(x,y,b,h);

fig.Units = 'centimeters';
fig.Position(3:4) = [6, 5]; % 7cmx5.25cm
fig.Color = [1.0, 1.0, 1.0]; % background color

ax.Units = 'centimeters';
% ax.Position = [1.4, 1, 4, 4];
ax.LineWidth = 0.75; % �������߿�
ax.FontName ='Times New Roman'; % 'Arial';
ax.FontSize = 9;
ax.TickLabelInterpreter = 'latex';

ax.XLabel.String = x_label;
ax.XLabel.Units = 'normalized';
%ax.XLabel.Position = [0.5, -0.125];
ax.XLabel.Interpreter = 'tex';
% ax.XLim(1) = 0;
ax.XTick=(0:25:100);
% tick
ax.XMinorTick = 'on';
ax.TickDir = 'in';

ax.TickLength(1) = 0.02;

yyaxis left;
l1=plot(h,y1,'k');

% ���ú���ʽ��ͼ������setʽ��Ҫע�⺯������Сд��������
l1.LineWidth=llw; % �������߿��
% h1.LineStyle='--'
% h1.Color=[0.3 0.8 0.9];
ax.YLabel.String=y_label1;
ax.YLabel.Units = 'normalized';
% ax.YLabel.Position = [-0.1, 0.5];
ax.YLabel.Interpreter = 'latex';
% ax.YLim(1) = 0;
axis([0 100 0 1.6]);
ax.YColor= [0 0 0];
ax.YTick=(0:0.4:1.6);
ax.YMinorTick = 'on';
ax.TickLength = [0.02 0.035];
ax.TickDir = 'in';

yyaxis right;
l2=plot(h(1:end-1),diff(y1));
l2.LineWidth=llw;
l2.LineStyle='--';

ax.YLabel.String=y_label2;
% ax.YLabel.Position = [0, 0.5];
ax.YLabel.Interpreter = 'latex';
% ax.YLim(1) = 0;
axis([0 100 0 0.12]);
ax.YTick=(0:0.03:0.12);
ax.YMinorTick = 'on';
ax.TickDir = 'in';

% ���� legend(ax)
leg=legend(ax,"$H_x$","$H^{'}_{x}$");
leg.Interpreter = 'latex';
leg.Location = 'east';
leg.NumColumns= 1;
leg.Box = 'off';
leg.LineWidth= 0.5;
% saveas(fig, 'MFL_depth', 'svg')
print('MFL_depth','-dsvg');
% ͬʱ���Ƶ���������
print('-clipboard','-dmeta'); 
