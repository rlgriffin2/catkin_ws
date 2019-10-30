#include "rtosclass/catchdelayC.h"


//Subscribed to t_delay, publishes to t_selected_data when message from t_actual_data isn't received in time window (measured by t_delay)
	catchdelayC::catchdelayC(ros::NodeHandle n){

		delayed = true;
		fillerInfo.info = "Filler message, real message delayed";
		//ros fields
		data_sub = n.subscribe<rtosclass::Message>("t_actual_data", 1, &catchdelayC::subFunc, this);
		delay_sub = n.subscribe<rtosclass::Delayed>("t_delay", 1, &catchdelayC::delayFunc, this);
		data_pub = n.advertise<rtosclass::Message>("t_selected_data", 1);
		//loop_rate(9);
	}

void catchdelayC::subFunc(const rtosclass::Message::ConstPtr &msg)
{
	receivedInfo.info = msg->info;
}

void catchdelayC::delayFunc(const rtosclass::Delayed::ConstPtr &delayMsg)
{
	delayed = delayMsg->delayed;
}

void catchdelayC::run(){
	ros::Rate loop_rate(10);
	while (ros::ok())
	{
		if (!delayed)
		{ //probably don't even need the received thing
			data_pub.publish(receivedInfo);
		}
		else
		{
			data_pub.publish(fillerInfo);
		}
		ros::spinOnce();
		loop_rate.sleep();
	}
}
int main(int argc, char **argv)
{
	ros::init(argc, argv, "n_catchdelayC");
	ros::NodeHandle n;
	catchdelayC* cd = new catchdelayC(n);
	cd->run();

}

/*
 no match for call to ‘(boost::_mfi::mf1<void, catchdelayC, const boost::shared_ptr<const rtosclass::Delayed_<std::allocator<void> > >&>) 
 														   (const boost::shared_ptr<const rtosclass::Delayed_<std::allocator<void> > >&)

no match for call to ‘(boost::_mfi::mf1<void, catchdelayC, const boost::shared_ptr<const rtosclass::Message_<std::allocator<void> > >&>) 
														  (const boost::shared_ptr<const rtosclass::Message_<std::allocator<void> > >&)’

														  */

/*		data_sub = n.subscribe<rtosclass::Message>("t_actual_data", 1, boost::bind(&catchdelayC::subFunc, this, _1));
		delay_sub = n.subscribe<rtosclass::Delayed>("t_delay", 1, boost::bind(&catchdelayC::delayFunc, this, _1));*/