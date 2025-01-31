clear, clc, close all
% 3d render and rotator for any set of points by LampYeeter
% points must be stored in a 3 row array named "points"
% pringle.dat is included in the GitHub repository as an example
pointsfile = input('Enter filename of points:');
load(pointsfile,'-mat');
x = points(1,:);
y = points(2,:);
z = points(3,:);

s = 0; 
d = 5; % if your object is too big increase d and/or decrease f
f = 5; % d is the distance from the origin f is focal length.
framecount = 30*input('Enter length of video (s):');

xtheta = (pi/(180/input('X axis rotation speed (degree/s):')))/30;
ytheta = (pi/(180/input('Y axis rotation speed (degree/s):')))/30;
ztheta = (pi/(180/input('Z axis rotation speed (degree/s):')))/30;

vidfile = input('Enter filename of video:');

writer = VideoWriter(vidfile);
open(writer);

while s < framecount
    yrot = (y*cos(xtheta)) + (z*sin(xtheta));
    zrot = -(y*sin(xtheta)) + (z*cos(xtheta));

    y = yrot;
    z = zrot;

    xrot = (x*cos(ytheta)) + (z*sin(ytheta));
    zrot = (-x*sin(ytheta)) + (z*cos(ytheta));

    x = xrot;
    z = zrot;

    xrot = (x*cos(ztheta)) - (y*sin(ztheta));
    yrot = (x*sin(ztheta)) + (y*cos(ztheta));

    x = xrot;
    y = yrot;

    xproj = x.*(f./(y+d));
    zproj = z.*(f./(y+d));

    plot(xproj,zproj,'.');
    xlim([-2,2])
    ylim([-1.6,1.6])
    drawnow
    frame = getframe(figure(1));
    writeVideo(writer,frame);
    s = s + 1;
end
close(writer)