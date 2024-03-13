load('test_consumer_valve_controller\test_cosumer_valve_controller.mat')

f=figure()
subplot(2,1,1)
plot(out.tower_34.v11_32_demand)
hold on
plot(out.tower_34.v11_32_flow)
grid
legend('Refrence', 'Measurement')
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
