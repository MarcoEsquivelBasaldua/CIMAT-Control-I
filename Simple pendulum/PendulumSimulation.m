function PendulumSimulation(t, Q, param)
    figure(1);
    plot(t,Q(:,1),'r')
    xlabel('time');ylabel('Angle (Rad)'); title('Angle Graph');
    axis([0 t(end) -3.5 3.5])
    grid on

    figure(2);
    plot(t,Q(:,2),'m')
    xlabel('time');ylabel('Angular velocity (Rad/s)'); title('Angular Velocity Graph');
    axis([0 t(end) -6 6])
    grid on

    figure(3);
    plot(Q(:,1),Q(:,2))
    %axis([-1 1 -2.5 2.5])
    xlabel('Angle');ylabel('Angular velocity'); title('Orbit in State Space');
    grid on
    
    %Pendulum Simulation
    R_theta = Q(:,1);
    X = param.l.*sin(R_theta);
    Y = -param.l.*cos(R_theta);
    xmin = -param.l-0.2;
    xmax = param.l+0.2;
    ymin = -param.l-0.2;
    ymax = param.l+0.2;
    
    
    for i = 1:length(t)
        figure(4)
        hold off
        axis([xmin xmax ymin ymax])
        plot([xmin,xmax],[0,0],'k')
        hold on
        plot([0,0],[ymax,ymin],'k--')
        plot([0,X(i)],[0,Y(i)],'b-','LineWidth',2)
        circle(X(i),Y(i),0.05)
        %plot(X(i),Y(i),'b*','LineWidth',10)
        
        pause(t(end)/length(t))
    end
end

function circle(x,y,r)
%x and y are the coordinates of the center of the circle
%r is the radius of the circle
%0.01 is the angle step, bigger values will draw the circle faster but
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
plot(x+xp,y+yp,'k','LineWidth',10);
end
