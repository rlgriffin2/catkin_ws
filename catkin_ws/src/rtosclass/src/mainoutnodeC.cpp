#include "ros/ros.h"
#include "rtosclass/Message.h"
#include "rtosclass/Delayed.h"

//I want this node to send a message to catchdelay when it gets the message, and catchdelay keeps track of how long
//it's been since the last message, so if its >(for example)10ms, then it sends back some phony data. Then, if this node
//receives information from that line, it should somehow ovverride delayedpublish's message with catchdelay's.

ros::Publisher pub;
void dataReceived(const rtosclass::Message::ConstPtr &msg)
{

	ROS_INFO("Message: %s", msg->info.c_str());
}
int main(int argc, char **argv)
{
	ros::init(argc, argv, "n_mainoutnodeC");
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("t_selected_data", 1, dataReceived);
	ros::Rate loop_rate(8);
	loop_rate.sleep();
	ros::spin();
}
