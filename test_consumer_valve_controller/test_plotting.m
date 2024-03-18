load('test_consumer_valve_controller\single_valve_controller.mat')

f=figure()
subplot(2,1,1)
plot(out.consumer_32.v11_12_32_demand)
hold on
plot(out.consumer_32.q_32_v1)
grid
legend('Reference', 'Measurement')
title("")
xlabel("Time [s]")
ylabel("Flow [m^3/h]")
subplot(2,1,2)
plot(out.consumer_32.v11_32, color="#EDB120")
xlabel("Time [s]")
ylabel("Opening degree [0-100]")
legend("Actuation")
grid
title("")
fontname(f,'Times')
exportgraphics(f,'test_consumer_valve_controller\consumer_valve_controller_test.pdf')


%% Double controller
load('test_consumer_valve_controller\Double_valve_controller.mat')

f=figure()
subplot(2,1,1)
plot(out.consumer_32.v11_12_32_demand)
hold on
plot(out.consumer_32.q_32_v1)
plot(out.consumer_32.q_32_v2)
plot(out.consumer_32.q_32_v1+out.consumer_32.q_32_v2)

grid
legend('Refrence', 'Measurement')
title("")
xlabel("Time [s]")
ylabel("Flow [m^3/h]")
subplot(2,1,2)
hold on
plot(out.consumer_32.v11_32)
plot(out.consumer_32.v12_32)
xlabel("Time [s]")
ylabel("Opening degree [0-100]")
legend("Actuation")
grid
title("")
fontname(f,'Times')