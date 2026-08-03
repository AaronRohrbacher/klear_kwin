#include <QApplication>
#include <QFile>
#include <QLabel>
#include <QUiLoader>

int main(int argc, char **argv)
{
    QApplication app(argc, argv);
    if (argc != 2) {
        return 2;
    }

    QFile file(QString::fromLocal8Bit(argv[1]));
    if (!file.open(QFile::ReadOnly)) {
        return 3;
    }

    QUiLoader loader;
    QWidget *form = loader.load(&file);
    if (!form) {
        return 4;
    }

    QLabel *logo = form->findChild<QLabel *>(QStringLiteral("logo"));
    if (!logo || logo->pixmap().isNull()) {
        return 5;
    }

    return 0;
}
