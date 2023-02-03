class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'The Right Materials',
      image: 'lib/assets/images/onBoarding_1.svg',
      description:
          "Rorem ipsum dolor sit amet, dor bin consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."),
  OnboardingContent(
      title: 'Use Ecologic Materials & Protect The Environment',
      image: 'lib/assets/images/onBoarding_2.svg',
      description:
          "Rorem ipsum dolor sit amet, dor bin consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."),
  OnboardingContent(
      title: 'Economies Your Building Budget',
      image: 'lib/assets/images/onBoarding_3.svg',
      description:
          "Rorem ipsum dolor sit amet, dor bin consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."),
];
