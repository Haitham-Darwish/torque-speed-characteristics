
![image](https://user-images.githubusercontent.com/68920161/176968323-d1be87a5-ef5e-405a-9d65-261905cac2b1.png)

![Rated conditions](https://user-images.githubusercontent.com/68920161/176967914-d7e83523-a752-42cd-953f-090d803aac5f.png)

* The graph as we expected as torque increases as speed the rotor increases till reach maximum then decreases and increases again with speed, and below we will explain why that happen.
* For the first region between 2<s<1 braking region as that happen when the rotor is still fixed and when nm=0 the rotor starts to rotate. 
* For second region between 0<s<1 which represents the speed between 0<nm<ns=750, and here the rotor is started to rotate and acts as motor and therefore this region called motor region.
* For third region between -1<s<0 which represent ns=750<nm< 2ns=1500, and here the rotor generates electricity as it will rotate faster than the field in the stator so it will act as generator and therefore this region called generator region.
* If we look at the graph, we will see that above the full load of the torque it will acts as motor as stator gives it power to rotate as torque=power/w and below the * full load it will act as generator as rotor will supply power to the stator or take negative power from stator therefore if we look at the graph, we will see torque is negative and torque=power/w then power is negative.
* For the rated conditions start up condition should be able to drive the load with a margin to be able to drive the load due to any non-ideality that may happen as will we see.
<br>

![image](https://user-images.githubusercontent.com/68920161/176968489-a14dd6a4-4a2d-4e25-95c9-f5a1e05bf95f.png)
* The shape of graph is the same as rated conditions which is expected but the amplitude changed greatly as voltage in the equation is squared i.e., torque is proportional to voltage squared:
<p align="center">
$T_d=$ $3 * v_{th}^2 * (R_2'/s) \over ω_s ((R_eq+R'_2/s)^2+(X_eq+X'_2 )^2 ) $
</p>

* Where Vth is the Thevenin voltage which is directly to Vrated:
<p align="center">
$V_{th}=$ $V_{phase} * X_m \over \sqrt{R_1^2+(X_1+X_m )^2}$
,$V_{phase}=$ $V_{rated} \over \sqrt{3}$
</p>

* Therefore, the voltage decreases than rated. Hence, the minimum changed and became nearer to full load torque (s=0, n=ns) as the voltage decreases, but the regions still the same as full load is the same and we can observe this point by looking at the intersection as shown in the next figure:
Since full load happen at s=0 and nm=(1-s) ns, then nm = ns then all will have the same full load torque
<br>

![image](https://user-images.githubusercontent.com/68920161/176970986-fb2c8798-5599-43c0-9580-173412e07867.png)

 
It will have the same shape and regions but different full load torque as the speed is frequency dependent. Therefore, if we looked at the graph we will see as frequency increases the curve is stretched and each region take larger region, the braking stared early and motor end late as ns increases and the generator region ends later. 
The amplitude of the torque is also decrease as speed and frequency increases and this is because we have ω_s  in the denominator and we have inductive impedance which also depends on frequency.
<p align="center">
$T_d=$ $3 * v_{th}^2 * (R_2'/s) \over ω_s ((R_eq+R'_2/s)^2+(X_eq+X'_2 )^2 ) $
</p>
For the full load torque position will be different as ns is different as frequency is different as shown in the next figure.
ns_freq=15=225
ns_freq=25=375
ns_freq=50=750
ns_freq=65=975
 <br>
 
![image](https://user-images.githubusercontent.com/68920161/176971044-bad83fd7-b66c-4949-ab82-6690f247689a.png)

![image](https://user-images.githubusercontent.com/68920161/176971146-14950e19-25c4-4f12-b7c4-0851dcce22ff.png)

* Also, the same shape but with slight change in amplitude as if look at the equation we will see Req in the denominator which is function of Thevenin impedance which is function of R1, and also the Thevenin voltage is function of R1 and is in the denominator then as R1 increases the torque is decreases.
* Also, all have the same full load point as all have same frequency(freq=50), and ns=60f/4=750

<p align="center">
$T_d=$ $3 * v_{th}^2 * (R_2'/s) \over ω_s ((R_eq+R'_2/s)^2+(X_eq+X'_2 )^2 ) $
</p>

* Where Vth is the Thevenin voltage which is directly to Vrated:
<p align="center">
$V_{th}=$ $V_{phase} * X_m \over \sqrt{R_1^2+(X_1+X_m )^2}$
,$V_{phase}=$ $V_{rated} \over \sqrt{3}$
</p>

For the local min Req subtracted from negative value and when we add negative value to positive value the largest positive is the smallest and since it is in the denominator get larger torque then |4R1|>|3R1|>|2R1|.
Note that Vth is f(R1) so it may be hard to know what happen to the torque but from graph it seems that Req has dominant effect. 
For the last region the |4R1|<|3R1|<|2R1| and that because R2'/s become small negative value then the output from the addition is positive so as Req increases the denominator increases and torque decreases  

**Note that** it can be done in one shot as follow
<pre>
<code >
  r=repmat((3 * v_th'.^2 * (r2) ./ s)', 1, 1, 4);
  r2=repmat((w_sync' .* ((r_th + (r2)./s).^2 + (x_th + x2)^2) )', 1, 1, 5);
  r2=permute(r2,[1,3,2]);
  
  t_ind3 =  r./r2;
</code>
</pre>
