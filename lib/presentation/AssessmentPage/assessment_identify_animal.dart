import 'package:flutter/material.dart';
import 'package:measureap/presentation/AssessmentPage/Widgets/animal_switch_listtile.dart';

class AssessmentIdentifyAnimal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Identify the animals',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          SizedBox(height: 8),
          Text(
              'Please show the patient the following animals and check their response.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey)),
          SizedBox(height: 24),
          AnimalSwitchListTile(
            imageUrl: 'https://prajwollama.com.np/prajwollama.jpg',
            title: 'Chicken',
            value: false,
            onChanged: (value) {},
          ),
          AnimalSwitchListTile(
            imageUrl: 'https://prajwollama.com.np/prajwollama.jpg',
            title: 'Horse',
            value: false,
            onChanged: (value) {},
          ),
          AnimalSwitchListTile(
            imageUrl: 'https://prajwollama.com.np/prajwollama.jpg',
            title: 'Dog',
            value: true,
            onChanged: (value) {},
          ),
          Spacer(),
          Text(
            '1 correct',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Finish'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
