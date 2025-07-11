import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
from datetime import datetime
import streamlit as st

def enviar_email_pdf(pdf_bytes, sujeto, ejercicio, destinatario):
    """Envía el PDF por email"""
    try:
        # Verificar configuración de email
        email_user = st.secrets.get("email_user")
        email_password = st.secrets.get("email_password")
        if not email_user or email_user == "tu_email@gmail.com":
            return False, "⚠️ Configuración de email no encontrada. Verifica el archivo .streamlit/secrets.toml"
        if not email_password or email_password == "tu_password_de_aplicacion":
            return False, "⚠️ Contraseña de email no configurada. Verifica el archivo .streamlit/secrets.toml"
        smtp_server = "smtp.gmail.com"
        smtp_port = 587
        msg = MIMEMultipart()
        msg['From'] = email_user
        msg['To'] = destinatario
        msg['Subject'] = f"Reporte de Ergonomía - {sujeto} - {ejercicio}"
        body = f"""
        Hola,
        
        Adjunto el reporte de evaluación ergonómica para:
        - Sujeto: {sujeto}
        - Ejercicio: {ejercicio}
        - Fecha: {datetime.now().strftime('%d/%m/%Y %H:%M')}
        
        Saludos,
        Sistema de Evaluación Ergonómica
        """
        msg.attach(MIMEText(body, 'plain'))
        attachment = MIMEBase('application', 'octet-stream')
        attachment.set_payload(pdf_bytes)
        encoders.encode_base64(attachment)
        attachment.add_header('Content-Disposition', 'attachment', filename=f"reporte_ergonomia_{sujeto}_{ejercicio}.pdf")
        msg.attach(attachment)
        server = smtplib.SMTP(smtp_server, smtp_port)
        server.starttls()
        server.login(email_user, email_password)
        text = msg.as_string()
        server.sendmail(email_user, destinatario, text)
        server.quit()
        return True, "✅ Email enviado correctamente"
    except smtplib.SMTPAuthenticationError:
        return False, "❌ Error de autenticación. Verifica tu email y contraseña de aplicación"
    except smtplib.SMTPRecipientsRefused:
        return False, "❌ Email de destino inválido"
    except smtplib.SMTPServerDisconnected:
        return False, "❌ Error de conexión con el servidor SMTP"
    except Exception as e:
        return False, f"❌ Error al enviar email: {str(e)}" 