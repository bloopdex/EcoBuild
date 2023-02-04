import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/onboarding_content_model.dart';
import '../home.dart';

class PageIndexState {
  int currentIndex = 0;

  PageIndexState({required this.currentIndex});
}

class PageIndexCubit extends Cubit<PageIndexState> {
  PageIndexCubit() : super(PageIndexState(currentIndex: 0));

  void increment() {
    emit(PageIndexState(currentIndex: state.currentIndex + 1));
  }

  void decrement() {
    emit(PageIndexState(currentIndex: state.currentIndex - 1));
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);

    return BlocProvider(
      create: (context) => PageIndexCubit(),
      child: Scaffold(
        body: BlocBuilder<PageIndexCubit, PageIndexState>(
          builder: (context, state) => Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    (state.currentIndex < index)
                        ? context.read<PageIndexCubit>().increment()
                        : context.read<PageIndexCubit>().decrement();

                    print("index: $index, State : ${state.currentIndex}");
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          const Spacer(
                            flex: 3,
                          ),
                          SvgPicture.asset(
                            contents[i].image,
                            height: 300,
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          Text(
                            contents[i].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(
                            flex: 3,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    height: 10,
                    width: state.currentIndex == index ? 25 : 10,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                  height: 60,
                  margin: const EdgeInsets.all(40),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (state.currentIndex == contents.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Home(),
                          ),
                        );
                      }
                      controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Theme.of(context).primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: Text(
                      state.currentIndex == contents.length - 1
                          ? "Continue"
                          : "Next",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
