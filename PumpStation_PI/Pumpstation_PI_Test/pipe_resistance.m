load("pump_station_step_response_and_pipe_resistances\pump_station_41_steps_v2.mat")

figure(1)
yyaxis left
plot(out.pipe_20.q4_20)
yyaxis right
plot(out.pump_41.pump_41_ctr_1)

%% Plot pressure
f = figure
yyaxis left
plot(out.pipe_20.q4_20)
yyaxis right
plot(out.pipe_20.p43_20)
title("Two way valve directional?")
grid


%%
times =[55 86 118 148 179 237 278 307 384]
q_analysis = squeeze(out.pipe_20.q4_20.Data(times));
p_analysis = squeeze(p_drop.Data(times));


f = figure
yyaxis left
plot(out.pipe_20.q4_20)
hold on 
plot(times,q_analysis,'X', LineWidth=2)
ylabel("Flow [m^3/h]")
yyaxis right
p_drop = (out.pipe_20.p41_20-out.pipe_20.p43_20)
plot(p_drop)
hold on
plot(times,p_analysis,'X', LineWidth=2)
ylabel("Pressure drop [bar]")
xlabel("Time [s]")
legend("Measuremets", "Used datapoints", Location="southeast")
title("")
fontname(f,'Times')
exportgraphics(f,'pump_station_step_response_and_pipe_resistances\Pipe_resistance_estimation\pipe_resistance_used_data_module41.pdf')


%% Scond order apporximation


X = [ones(size(q_analysis)) q_analysis.^2];
a = X\p_analysis
y2 = a(2)*x1.^2 + a(1);

f= figure();
plot(q_analysis, p_analysis,'x')
hold on
plot(x1,y2)
xlabel("Flow [m^3/h]")
ylabel("Pressure drop  [bar]")
legend("Measurementes", "Model \newline p(u) = 0.31\cdotu^2-0.003")
fontname(f,'Times')
exportgraphics(f,'pump_station_step_response_and_pipe_resistances\Pipe_resistance_estimation\pipe_resistance_model_module41.pdf')