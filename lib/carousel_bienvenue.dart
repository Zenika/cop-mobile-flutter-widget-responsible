import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselBienvenue extends StatefulWidget {
  final children = [
    const Item(Icons.access_alarm, "Lorem ipsum et dolor sit amet"),
    const Item(Icons.ac_unit, "Neque porro quisquam est qui dolorem ipsum"),
    const Item(Icons.access_time,
        "quia dolor sit amet, consectetur, adipisci velit..."),
    const Item(Icons.account_balance,
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
  ];
  CarouselBienvenue({Key? key}) : super(key: key);

  @override
  State<CarouselBienvenue> createState() => _CarouselBienvenueState();
}

class Item extends StatelessWidget {
  final IconData icon;

  final String title;

  const Item(
    this.icon,
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final backgroundHeight = height * 0.4;
    return Column(
      children: [
        SizedBox(
          height: backgroundHeight,
          child: Center(
              child: Icon(
            icon,
            size: 100,
          )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        )
      ],
    );
  }
}

class _CarouselBienvenueState extends State<CarouselBienvenue> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCarousel(context),
        const SizedBox(height: 24),
        buildCarouselIndicator(context),
      ],
    );
  }

  buildCarousel(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final backgroundHeight = height * 0.4;
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background fixe
        Positioned(
          top: 0,
          child: Container(
            color: Colors.black38,
            width: MediaQuery.of(context).size.width,
            height: backgroundHeight,
          ),
        ),
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            viewportFraction: 1,
            height: height * 0.55,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.children,
        ),
      ],
    );
  }

  Row buildCarouselIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 40,
          ),
          tooltip: "Diapositive précédente",
          onPressed: _goToPrevious,
        ),
        ...List<Widget>.generate(
          widget.children.length,
          (index) {
            var isSelected = index == _currentIndex;
            return Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  width: isSelected ? 24 : 12,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                  ),
                ));
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 40,
          ),
          tooltip: "Diapositive suivante",
          onPressed: _goToNext,
        ),
      ],
    );
  }

  _goToNext() {
    int nextIndex = _currentIndex + 1;
    if (nextIndex == widget.children.length) {
      nextIndex = 0;
    }
    _goToPage(nextIndex);
  }

  _goToPrevious() {
    int previousIndex = _currentIndex - 1;
    if (previousIndex < 0) {
      previousIndex = widget.children.length - 1;
    }
    _goToPage(previousIndex);
  }

  Future<void> _goToPage(int index) {
    return _carouselController.animateToPage(
      index,
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
    );
  }
}
