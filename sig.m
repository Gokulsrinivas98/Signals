clf;clc;clear all; close all;
	load chirp;
	y1=y;Fs1=Fs;
	Obj1 = audioplayer(y1,Fs1);
	load gong;
	y2=y;Fs2=Fs;
	Obj2 = audioplayer(y2,Fs2);

	%extend length of y1 to be as y2
	y1(numel(y2)) = 0;
	%playing one after the other 
	subplot(1,2,1),plot(y1),title('Chirp');
	subplot(1,2,2),plot(y2),title('Gong');
	playblocking(Obj1);
	playblocking(Obj2);

	%playing simultaneously
	z=y1+y2;
	figure;
	plot(z),title('Chirp+Gong');
	Obj_sim=audioplayer(z,Fs1);
	playblocking(Obj_sim);

%Convolution
	x=conv(y1,y2);
	figure; plot(x),title('Convolution');
	Obj_conv=audioplayer(x,Fs1);
	playblocking(Obj_conv);
	%Correlation
	r12=xcorr(y1,y2);
	r21=xcorr(y2,y1);
	figure;
	subplot(1,2,1),plot(r12),title('CrossCorr r12');
	subplot(1,2,2),plot(r21),title('CrossCorr r21');
	Obj_corr=audioplayer(r12,Fs1);
	Obj_rcorr=audioplayer(r21,Fs1);
	playblocking(Obj_corr)
	playblocking(Obj_rcorr)

