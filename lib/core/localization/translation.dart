import 'package:get/get.dart';

class MyTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          // Onboarding
          'onBoardingTitle1': 'Welcome to Trendify Store',
          'onBoardingTitle2': 'Shop Everything You Love !',
          'onBoardingTitle3': 'Fast and Reliable Delivery !',
          'onBoardingSubTitle1':
              'Discover a seamless shopping experience where convenience meets style your one stop destination for effortless and enjoyable online shopping.',
          'onBoardingSubTitle2':
              'Discover top-quality products at unbeatable prices all wrapped in a smooth, secure, and enjoyable shopping experience.',
          'onBoardingSubTitle3':
              'Get your favorite items delivered straight to your doorstep anytime, anywhere, with speed and reliability you can count on.',

          // Login
          'loginTitle': 'Shop Smarter',
          'loginSubTitle': 'Log in to Access Exclusive Deals and Simplify Your Shopping Experience',
          'email': 'Email',
          'password': 'Password',
          'rememberMe': 'Remember Me',
          'forgetPassword': 'Forget Password',
          'signIn': 'Sign In',
          'createAccount': 'Create Account',
          'orSignInWith': 'Or Sign In With',

          // SignUp
          'signupTitle': 'Let’s Get You Registered',
          'firstName': 'First Name',
          'lastName': 'Last Name',
          'phoneNumber': 'Phone Number',
          'iAgreeTo': 'I agree to',
          'privacyPolicy': 'Privacy Policy',
          'and': 'and',
          'termsOfUse': 'Terms of use',
          'orSignupWith': 'Or Sign up With',

          // Forget Password
          'forgetPasswordTitle': 'Forget Password',
          'forgetPasswordSubTitle':
              'No worries! Enter your registered email address, and we’ll help you reset your password',
          'submit': 'Submit',

          // Reset Password
          'resetPasswordTitle': 'Password Reset Email Sent',
          'resetPasswordSubTitle':
              'We’ve sent a password reset link to your email. Please check your inbox and follow the instructions to reset your password',
          'done': 'Done',

          // Verify Email
          'verifyEmailTitle': 'Verify your email address!',
          'verifyEmailSubTitle':
              'We’ve sent a verification link to your email. Please check your inbox and click the link to verify your account',
          'uContinue': 'Continue',
          'resendEmail': 'Resend Email',

          // Account Created
          'accountCreatedTitle': 'Your account successfully created',
          'accountCreatedSubTitle':
              'Congratulations! Your account has been successfully created. You can now explore all the amazing features, start personalizing your experience, and enjoy seamless access to our services. Let’s get started!',

          // Home
          'homeAppBarTitle': 'Good Morning',
          'homeAppBarSubTitle': 'Unknown Pro',
          'searchBarTitle': 'Search in Store',
          'popularCategories': 'Popular Categories',
        },

        'ar': {
          'onBoardingTitle1': 'مرحبًا بك في متجر Trendify',
          'onBoardingTitle2': 'تسوّق كل ما تحب!',
          'onBoardingTitle3': 'توصيل سريع وموثوق!',
          'onBoardingSubTitle1':
              'اكتشف تجربة تسوق سلسة حيث تلتقي الراحة بالأناقة، وجهتك الأولى لتسوق إلكتروني سهل وممتع.',
          'onBoardingSubTitle2':
              'اكتشف منتجات عالية الجودة بأسعار لا تُنافس، كلها ضمن تجربة تسوق آمنة وسلسة وممتعة.',
          'onBoardingSubTitle3':
              'احصل على منتجاتك المفضلة إلى باب منزلك في أي وقت وأي مكان بسرعة وموثوقية.',

          'loginTitle': 'تسوّق بذكاء',
          'loginSubTitle': 'سجّل الدخول للوصول إلى العروض الحصرية وتبسيط تجربة التسوق الخاصة بك',
          'email': 'البريد الإلكتروني',
          'password': 'كلمة المرور',
          'rememberMe': 'تذكرني',
          'forgetPassword': 'نسيت كلمة المرور',
          'signIn': 'تسجيل الدخول',
          'createAccount': 'إنشاء حساب',
          'orSignInWith': 'أو سجّل الدخول باستخدام',

          'signupTitle': 'دعنا نبدأ بتسجيلك',
          'firstName': 'الاسم الأول',
          'lastName': 'اسم العائلة',
          'phoneNumber': 'رقم الهاتف',
          'iAgreeTo': 'أوافق على',
          'privacyPolicy': 'سياسة الخصوصية',
          'and': 'و',
          'termsOfUse': 'شروط الاستخدام',
          'orSignupWith': 'أو سجل باستخدام',

          'forgetPasswordTitle': 'نسيت كلمة المرور',
          'forgetPasswordSubTitle':
              'لا تقلق! أدخل بريدك الإلكتروني المسجّل وسنساعدك على إعادة تعيين كلمة المرور الخاصة بك',
          'submit': 'إرسال',

          'resetPasswordTitle': 'تم إرسال رابط إعادة تعيين كلمة المرور',
          'resetPasswordSubTitle':
              'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني. يرجى التحقق من البريد واتباع التعليمات.',
          'done': 'تم',

          'verifyEmailTitle': 'تحقق من بريدك الإلكتروني!',
          'verifyEmailSubTitle':
              'لقد أرسلنا رابط تحقق إلى بريدك الإلكتروني. تحقق من بريدك وانقر على الرابط لتفعيل حسابك.',
          'uContinue': 'متابعة',
          'resendEmail': 'إعادة إرسال البريد',

          'accountCreatedTitle': 'تم إنشاء حسابك بنجاح',
          'accountCreatedSubTitle':
              'تهانينا! تم إنشاء حسابك بنجاح. يمكنك الآن استكشاف كل الميزات الرائعة وتخصيص تجربتك.',
          
          'homeAppBarTitle': 'صباح الخير',
          'homeAppBarSubTitle': 'مستخدم غير معروف',
          'searchBarTitle': 'ابحث في المتجر',
          'popularCategories': 'الفئات الشائعة',
        },

        'fr': {
          'onBoardingTitle1': 'Bienvenue chez Trendify',
          'onBoardingTitle2': 'Achetez tout ce que vous aimez !',
          'onBoardingTitle3': 'Livraison rapide et fiable !',
          'onBoardingSubTitle1':
              'Découvrez une expérience d’achat fluide où la commodité rencontre le style. Votre destination pour des achats en ligne sans effort.',
          'onBoardingSubTitle2':
              'Trouvez des produits de qualité à des prix imbattables dans une expérience d’achat fluide, sécurisée et agréable.',
          'onBoardingSubTitle3':
              'Faites-vous livrer vos articles préférés directement chez vous rapidement et en toute fiabilité.',

          'loginTitle': 'Achetez plus intelligemment',
          'loginSubTitle': 'Connectez-vous pour accéder à des offres exclusives et simplifier vos achats',
          'email': 'Email',
          'password': 'Mot de passe',
          'rememberMe': 'Se souvenir de moi',
          'forgetPassword': 'Mot de passe oublié',
          'signIn': 'Connexion',
          'createAccount': 'Créer un compte',
          'orSignInWith': 'Ou connectez-vous avec',

          'signupTitle': 'Inscrivez-vous maintenant',
          'firstName': 'Prénom',
          'lastName': 'Nom de famille',
          'phoneNumber': 'Numéro de téléphone',
          'iAgreeTo': "J'accepte",
          'privacyPolicy': 'Politique de confidentialité',
          'and': 'et',
          'termsOfUse': "Conditions d'utilisation",
          'orSignupWith': "Ou s'inscrire avec",

          'forgetPasswordTitle': 'Mot de passe oublié',
          'forgetPasswordSubTitle':
              'Pas de souci ! Entrez votre email enregistré et nous vous aiderons à réinitialiser votre mot de passe.',
          'submit': 'Soumettre',

          'resetPasswordTitle': 'Email de réinitialisation envoyé',
          'resetPasswordSubTitle':
              'Nous avons envoyé un lien de réinitialisation à votre email. Veuillez vérifier votre boîte de réception.',
          'done': 'Terminé',

          'verifyEmailTitle': 'Vérifiez votre adresse email !',
          'verifyEmailSubTitle':
              'Nous avons envoyé un lien de vérification à votre email. Veuillez cliquer dessus pour valider votre compte.',
          'uContinue': 'Continuer',
          'resendEmail': 'Renvoyer l’email',

          'accountCreatedTitle': 'Compte créé avec succès',
          'accountCreatedSubTitle':
              'Félicitations ! Votre compte a été créé. Explorez toutes les fonctionnalités et profitez-en pleinement.',
          
          'homeAppBarTitle': 'Bonjour',
          'homeAppBarSubTitle': 'Utilisateur inconnu',
          'searchBarTitle': 'Rechercher dans le magasin',
          'popularCategories': 'Catégories populaires',
        },
      };
}
