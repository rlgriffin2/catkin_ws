#include "rtosclass/timerdelayC.h"


//This will interact with catchdelay, so whenever catchdelay sends to mainoutnode,
//it will also send something to here. Everytime this node receives that, it will restart a timer
//and will constantly be publishing how long has elapsed since that last message sent
//so that catchdelay can know if X millseconds have passed

//eventually use this to pass in the names of topics, so it can be more generic and scaleable
timerdelayC::timerdelayC(ros::NodeHandle n){
    startTime = 0;
    publish = false;
    maxDelay = 80;
    delayMsg.delayed = true;
    sub = n.subscribe<rtosclass::Message>("t_actual_data", 1, &timerdelayC::timerFunc, this);
    pub = n.advertise<rtosclass::Delayed>("t_delay", 1);
}
void timerdelayC::timerFunc(const rtosclass::Message::ConstPtr &msg)
{
    publish = true;
}

void timerdelayC::run(){
        startTime = clock();
        while (ros::ok())
    {
        if (publish && (clock() - startTime) / (CLOCKS_PER_SEC / 1000) <= maxDelay)
        {
            startTime = clock();
            delayMsg.delayed = false;
            pub.publish(delayMsg);
            publish = false;
        }
        else if ((clock() - startTime) / (CLOCKS_PER_SEC / 1000) >= maxDelay)
        {
            startTime = clock();
            delayMsg.delayed = true;
            pub.publish(delayMsg);
        }
        ros::spinOnce();
    }
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "n_timerdelayC");
    ros::NodeHandle n;
    timerdelayC* td = new timerdelayC(n);
    td->run();

}