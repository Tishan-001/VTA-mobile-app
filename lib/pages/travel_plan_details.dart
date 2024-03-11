import 'package:flutter/material.dart';
import 'package:vta_mobile/travel_plan.dart';

class TravelPlanDetails extends StatefulWidget {
  final TravelPlan travelPlan;

  const TravelPlanDetails({super.key, required this.travelPlan});

  @override
  State<TravelPlanDetails> createState() => _TravelPlanDetailsState();
}

class _TravelPlanDetailsState extends State<TravelPlanDetails> {
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    selectedImage = (widget.travelPlan.images.isNotEmpty
        ? widget.travelPlan.images[0]
        : null)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25.0,
            horizontal: 25.0,
          ),
          child: Text(
            widget.travelPlan.title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 26.0,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffffffff), Color(0xffd6e6f2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.travelPlan.images.isNotEmpty)
                //selected image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: SizedBox(
                    width: 327,
                    height: 255,
                    child: Image(
                      image: AssetImage('assets/$selectedImage'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              //Image list container
              Container(
                margin: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (String image in widget.travelPlan.images)
                      GestureDetector(
                        onTap: () => {
                          setState(() {
                            selectedImage = image;
                          })
                        },
                        child: Container(
                          margin: const EdgeInsets.all(2.0),
                          width: 59,
                          height: 59,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/$image'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Details of the travel plan
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Modify this dynamically based on your requirements
                  children: <Widget>[
                    const Text(
                      'Places',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.travelPlan.places),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      'Accommodation ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.travelPlan.accommodation),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      'Transportations',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.travelPlan.transportation),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      'User Feedback',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //TODO: Create method to show user feedbacks
                    const Text('description'),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Booking button
                  ElevatedButton(
                    onPressed: () {
                      //TODO : Add booking function
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF9ADE7B)),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(228, 40)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7.0,
                  ),

                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFF9EB8D9),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // TODO : Add book marks
                      },
                      icon: const Icon(Icons.bookmark_outline_rounded),
                    ),
                  ),
                  const SizedBox(
                    width: 7.0,
                  ),

                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color(0xFF9EB8D9),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // TODO : Add book marks
                      },
                      icon: const Icon(Icons.messenger_outline_sharp),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
