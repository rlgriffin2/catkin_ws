
#ifndef TIMER_DELAY_H
#define TIMER_DELAY_H
#include "rtosclass/Message.h"
#include "rtosclass/Delayed.h"
#include "ros/ros.h"
#include <ctime>

class timerdelayC{
    private:
        long startTime;
        bool publish;
        float maxDelay;
        rtosclass::Delayed delayMsg;
        ros::Subscriber sub;
        ros::Publisher pub;
    public:
        timerdelayC(ros::NodeHandle n);
        void timerFunc(const rtosclass::Message::ConstPtr &msg);
        void run();


};


#endif