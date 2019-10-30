

#ifndef CATCH_DELAY_H
#define CATCH_DELAY_H
#include "rtosclass/Message.h"
#include "rtosclass/Delayed.h"
#include "ros/ros.h"
#include <ctime>

class catchdelayC
{
    private:
        bool delayed;
        rtosclass::Message receivedInfo;
        rtosclass::Message fillerInfo;
        ros::Subscriber data_sub;
        ros::Subscriber delay_sub;
        ros::Publisher data_pub;
    public:
        catchdelayC(ros::NodeHandle n);
        void subFunc(const rtosclass::Message::ConstPtr &msg);
        void delayFunc(const rtosclass::Delayed::ConstPtr &delayMsg);
        void run();


};


#endif
