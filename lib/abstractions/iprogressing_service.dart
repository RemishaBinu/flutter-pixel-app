abstract class IProgressingService {
    Future onStart(String title);
    Future onProgress(String message, int progress);
    Future onFinished();
    Future onError();
}